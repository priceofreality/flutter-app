import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/init.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/repositories/game.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/transaction_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';

part 'daily_situation_state.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;
  final FinancialSituationCubit financialSituationCubit;
  final TransactionCubit transactionCubit;

  int _day = 1;
  int _currentOfDay = 0;

  DailySituationCubit(
      {required this.choiceCubit,
      required this.financialSituationCubit,
      required this.transactionCubit})
      : super(DailySituationState(gameRepository.dailySituations[1]!,
            gameRepository.dailySituations[1]![0])) {
    choiceCubit.emitChoices(gameRepository.dailySituations[1]![0].choices);
  }

  void _resetIndexes() {
    _day = 1;
    _currentOfDay = 0;
  }

  void emitFinancialSituation(FinancialSituation financialSituation) =>
      financialSituationCubit.emitFinancialSituation(financialSituation);

  void emitNextDailySituation() {
    final dailySituation = state.current;
    final choice = choiceCubit.state.selected!;

    //if choice finishes game
    if (choice.concludes) {
      _resetIndexes();
      emit(DailySituationFinishedState());
      return;
    }

    //new day
    if (++_currentOfDay >= state.dailySituations.length) {
      _currentOfDay = 0;

      gameRepository.unlockDailySituation(choice.id, state.current.id);

      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null || transactionCubit.state.budget <= 0) {
        _resetIndexes();

        transactionCubit.emitTransaction(dailySituation, choice);

        emit(DailySituationFinishedState());
        return;
      }

      transactionCubit.emitTransaction(dailySituation, choice);

      emit(
          DailySituationState(dailySituations, dailySituations[_currentOfDay]));
      choiceCubit.emitChoices(dailySituations[_currentOfDay].choices);

      return;
    }

    //same day

    gameRepository.unlockDailySituation(choice.id, state.current.id);

    transactionCubit.emitTransaction(dailySituation, choice);

    emit(DailySituationState(
        state.dailySituations, state.dailySituations[_currentOfDay]));
    choiceCubit.emitChoices(state.current.choices);
  }

  List<DailySituation>? _getNextDayDailySituations() {
    while (++_day <= gameRepository.maxDay) {
      if (gameRepository.dailySituations.containsKey(_day))
        return gameRepository.dailySituations[_day];
    }

    return null;
  }

  void emitReset() {
    DataInit.loadGameAssets().then((value) {
      choiceCubit.emitReset();

      emit(DailySituationState(gameRepository.dailySituations[1]!,
          gameRepository.dailySituations[1]![0]));
      choiceCubit.emitChoices(gameRepository.dailySituations[1]![0].choices);
    });
  }
}
