import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/repositories/game.dart';
import 'package:projet4/logic/cubit/choice_cubit.dart';

part 'daily_situation_state.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static final GameRepository gameRepository = GameRepository();

  final ChoiceCubit choiceCubit;

  int _day = 1;
  int _index = 0;

  DailySituationCubit({required this.choiceCubit})
      : super(DailySituationState(gameRepository.dailySituations[1]!,
            gameRepository.dailySituations[1]![0])) {
    choiceCubit.emitNewCoices(gameRepository.dailySituations[1]![0].choices);
  }

  void emitNextDailySituations() {
    if (++_index >= state.dailySituations.length) {
      _index = 0;
      final dailySituations = _getNextDayDailySituations();

      if (dailySituations == null) {
        //finish;

        return;
      }

      emit(DailySituationState(dailySituations, dailySituations[_index]));
      choiceCubit.emitNewCoices(dailySituations[_index].choices);

      return;
    }

    emit(DailySituationState(
        state.dailySituations, state.dailySituations[_index]));
    choiceCubit.emitNewCoices(state.dailySituations[_index].choices);
  }

  List<DailySituation>? _getNextDayDailySituations() {
    while (++_day <= gameRepository.maxDay) {
      if (gameRepository.dailySituations.containsKey(_day))
        return gameRepository.dailySituations[_day];
    }

    return null;
  }
}
