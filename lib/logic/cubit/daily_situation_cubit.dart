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

  int _currentDay = 1;
  int _currentDailySituationOfDay = 0;

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
    _currentDay = 1;
    _currentDailySituationOfDay = 0;
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
    if (++_currentDailySituationOfDay >= dailySituations.length) {
      _currentDailySituationOfDay = 0;
      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null) {
        transactionCubit.emitTransaction(dailySituation, choice);

        emit(DailySituationFinishedState());
        return;
      }

      transactionCubit.emitTransaction(dailySituation, choice);

      emit(DailySituationState(
          dailySituations, dailySituations[_currentDailySituationOfDay]));

      choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
          financialSituationId,
          gameRepository
              .getDailySituationsOfDay(
                  _currentDay)![_currentDailySituationOfDay]
              .id,
          optionCubit.state.selected));

      return;
    }

    //same day

    transactionCubit.emitTransaction(dailySituation, choice);

    emit(DailySituationState(
        dailySituations, state.dailySituations[_currentDailySituationOfDay]));

    choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
        financialSituationId,
        gameRepository
            .getDailySituationsOfDay(_currentDay)![_currentDailySituationOfDay]
            .id,
        optionCubit.state.selected));
  }

  List<DailySituation>? _getNextDayDailySituations() {
    while (++_currentDay <= gameRepository.maxDay) {
      if (gameRepository.getDailySituationsOfDay(_currentDay) != null)
        return gameRepository.getDailySituationsOfDay(_currentDay);
    }

    return null;
  }

  List<DailySituation> _getSameDayDailySituations() {
    return gameRepository.getDailySituationsOfDay(_currentDay)!;
  }

  void emitReset() {
    _resetIndexes();

    choiceCubit.emitReset();

    financialSituationCubit.emitReset();

    optionCubit.emitReset();

    transactionCubit.emitReset();

    DataInit.reloadGameAssets().then((_) {
      emit(DailySituationState(gameRepository.getDailySituationsOfDay(1)!,
          gameRepository.getDailySituationsOfDay(1)![0]));
    });
  }
}
