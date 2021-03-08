import 'package:bloc/bloc.dart';
import 'package:projet4/data/init.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/repositories/game.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';
import 'package:projet4/logic/cubit/financial_situation_cubit.dart';
import 'package:projet4/logic/cubit_state.dart';

part 'daily_situation_state.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;
  final FinancialSituationCubit financialSituationCubit;

  int _day = 1;
  int _index = 0;

  DailySituationCubit(
      {required this.choiceCubit, required this.financialSituationCubit})
      : super(DailySituationState(gameRepository.dailySituations[1]!,
            gameRepository.dailySituations[1]![0])) {
    choiceCubit.emitNewChoices(gameRepository.dailySituations[1]![0].choices);
  }

  void emitNextDailySituations() {
    if (state.current.id == 9) {
      _day = 1;
      _index = 0;
      emit(DailySituationFinishedState());

      return;
    }

    if (++_index >= state.dailySituations.length) {
      _index = 0;

      gameRepository.unlockDailySituation(
          choiceCubit.state.selected!.id, state.current.id);

      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null ||
          financialSituationCubit.state.financialSituation.budget <= 0) {
        _day = 1;
        _index = 0;
        emit(DailySituationFinishedState());

        return;
      }

      financialSituationCubit.emitTransaction(
          choiceCubit.state.selected!.cost != null
              ? choiceCubit.state.selected!.cost!
              : 0);

      emit(DailySituationState(dailySituations, dailySituations[_index]));
      choiceCubit.emitNewChoices(dailySituations[_index].choices);

      return;
    }

    financialSituationCubit.emitTransaction(
        choiceCubit.state.selected!.cost != null
            ? choiceCubit.state.selected!.cost!
            : 0);

    emit(DailySituationState(
        state.dailySituations, state.dailySituations[_index]));

    choiceCubit.emitNewChoices(state.current.choices);
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
      financialSituationCubit.emitReset();

      emit(DailySituationState(gameRepository.dailySituations[1]!,
          gameRepository.dailySituations[1]![0]));
      choiceCubit.emitNewChoices(gameRepository.dailySituations[1]![0].choices);
    });
  }
}
