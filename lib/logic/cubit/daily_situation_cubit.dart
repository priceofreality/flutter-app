import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:price_of_reality/data/init.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/repositories/game.dart';
import 'package:price_of_reality/logic/cubit/choice_cubit.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_state.dart';
import 'package:price_of_reality/logic/cubit/option_cubit.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;
  final FinancialSituationCubit financialSituationCubit;
  final TransactionCubit transactionCubit;
  final OptionCubit optionCubit;

  late int financialSituationId;
  late List<Option> options;

  int _currentDay = 1;
  int _currentDailySituationOfDay = 0;

  DailySituationCubit({
    required this.choiceCubit,
    required this.financialSituationCubit,
    required this.transactionCubit,
    required this.optionCubit,
  }) : super(DailySituationState(gameRepository.getDailySituationsOfDay(1)!,
            gameRepository.getDailySituationsOfDay(1)![0], null, null, null));

  emitStart() {
    //set transaction cubit
    transactionCubit
        .emitBudget(financialSituationCubit.state.selected!.initialBudget);

    //set financial cubit
    financialSituationCubit.emitNewDailySituations();

    //set option cubit
    options = optionCubit.options;

    optionCubit.emitNewDailySituations();

    financialSituationId = financialSituationCubit.state.selected!.id;
    //set choice cubit
    choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
        financialSituationId,
        gameRepository.getDailySituationsOfDay(1)![0].id,
        optionCubit.state.miscellaneousSelected));
  }

  void _resetIndexes() {
    _currentDay = 1;
    _currentDailySituationOfDay = 0;
  }

  void emitNextDailySituation() {
    final dailySituation = state.current;
    final choice = choiceCubit.state.selected!;

    transactionCubit.emitTransaction(dailySituation, choice);

    //if choice finishes game
    if (choice.concludes) {
      emit(DailySituationFinishedState());
      return;
    }

    final lastDay = _currentDay;
    final lastDailySituationOfDay = _currentDailySituationOfDay;

    bool? rewind = state.hasRewind;
    if (rewind == null) rewind = true;

    gameRepository.unlockDailySituation(choice);

    final dailySituations = _getSameDayDailySituations();

    //new day
    if (++_currentDailySituationOfDay >= dailySituations.length) {
      _currentDailySituationOfDay = 0;

      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null) {
        emit(DailySituationFinishedState());
        return;
      }

      choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
          financialSituationId,
          gameRepository
              .getDailySituationsOfDay(
                  _currentDay)![_currentDailySituationOfDay]
              .id,
          options));

      emit(DailySituationState(
          dailySituations,
          dailySituations[_currentDailySituationOfDay],
          lastDay,
          lastDailySituationOfDay,
          rewind));

      return;
    }

    //same day

    choiceCubit.emitChoices(gameRepository.getChoicesOfDailySituation(
        financialSituationId,
        gameRepository
            .getDailySituationsOfDay(_currentDay)![_currentDailySituationOfDay]
            .id,
        options));

    emit(DailySituationState(
        dailySituations,
        dailySituations[_currentDailySituationOfDay],
        lastDay,
        lastDailySituationOfDay,
        rewind));
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
          gameRepository.getDailySituationsOfDay(1)![0], null, null, null));
    });
  }

  void emitRewind() {
    Choice lastChoice = choiceCubit.state.lastChoiceState!.selected!;

    _currentDay = state.lastDay!;
    _currentDailySituationOfDay = state.lastDailySituationOfDay!;

    gameRepository.delockDailySituation(lastChoice);

    transactionCubit.emitRewind();

    choiceCubit.emitRewind();

    emit(DailySituationState(
        gameRepository.getDailySituationsOfDay(_currentDay)!,
        gameRepository
            .getDailySituationsOfDay(_currentDay)![_currentDailySituationOfDay],
        null,
        null,
        false));
  }
}
