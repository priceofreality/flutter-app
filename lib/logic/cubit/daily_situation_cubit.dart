import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/init.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/repositories/game.dart';
import 'package:price_of_reality/logic/cubit/choice_cubit.dart';
import 'package:price_of_reality/logic/cubit/option_cubit.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';

part 'daily_situation_state.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;
  final FinancialSituationCubit financialSituationCubit;
  final TransactionCubit transactionCubit;
  final OptionCubit optionCubit;

  late int financialSituationId;

  int _day = 1;
  int _currentOfDay = 0;

  DailySituationCubit({
    required this.choiceCubit,
    required this.financialSituationCubit,
    required this.transactionCubit,
    required this.optionCubit,
  }) : super(DailySituationState(gameRepository.getDailySituationsOfDay(1)!,
            gameRepository.getDailySituationsOfDay(1)![0]));

  emitStart() {
    //set transaction cubit
    transactionCubit
        .emitBudget(financialSituationCubit.state.selected!.initialBudget);

    //set financial cubit
    financialSituationCubit.emitNewDailySituations();

    //set option cubit
    optionCubit.emitNewDailySituations();

    financialSituationId = financialSituationCubit.state.selected!.id;
    //set choice cubit
    choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
        financialSituationId,
        gameRepository.getDailySituationsOfDay(1)![0].id,
        optionCubit.state.selected));
  }

  void _resetIndexes() {
    _day = 1;
    _currentOfDay = 0;
  }

  void emitNextDailySituation() {
    final dailySituation = state.current;
    final choice = choiceCubit.state.selected!;

    //if choice finishes game
    if (choice.concludes) {
      _resetIndexes();
      emit(DailySituationFinishedState());
      return;
    }

    gameRepository.unlockDailySituation(choice);

    final dailySituations = _getSameDayDailySituations();

    //new day
    if (++_currentOfDay >= dailySituations.length) {
      _currentOfDay = 0;
      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null) {
        _resetIndexes();

        transactionCubit.emitTransaction(dailySituation, choice);

        emit(DailySituationFinishedState());
        return;
      }

      transactionCubit.emitTransaction(dailySituation, choice);

      emit(
          DailySituationState(dailySituations, dailySituations[_currentOfDay]));

      choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
          financialSituationId,
          gameRepository.getDailySituationsOfDay(_day)![_currentOfDay].id,
          optionCubit.state.selected));

      return;
    }

    //same day

    transactionCubit.emitTransaction(dailySituation, choice);

    emit(DailySituationState(
        dailySituations, state.dailySituations[_currentOfDay]));

    choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
        financialSituationId,
        gameRepository.getDailySituationsOfDay(_day)![_currentOfDay].id,
        optionCubit.state.selected));
  }

  List<DailySituation>? _getNextDayDailySituations() {
    while (++_day <= gameRepository.maxDay) {
      if (gameRepository.getDailySituationsOfDay(_day) != null)
        return gameRepository.getDailySituationsOfDay(_day);
    }

    return null;
  }

  List<DailySituation> _getSameDayDailySituations() {
    return gameRepository.getDailySituationsOfDay(_day)!;
  }

  void emitReset() {
    DataInit.reloadGameAssets().then((_) {
      choiceCubit.emitReset();

      financialSituationCubit.emitReset();

      optionCubit.emitReset();

      transactionCubit.emitReset();

      emit(DailySituationState(gameRepository.getDailySituationsOfDay(1)!,
          gameRepository.getDailySituationsOfDay(1)![0]));
    });
  }
}
