import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/repositories/game.dart';

part 'daily_situation_state.dart';

class DailySituationCubit extends Cubit<DailySituationState> {
  static GameRepository gameRepository = GameRepository();

  DailySituationCubit()
      : super(DailySituationState(gameRepository.dailySituations[1]!,
            gameRepository.dailySituations[1]![0]));

  void emitNextDailySituationsOfDay(DailySituation newValue) =>
      emit(DailySituationState(state.dailySituations, newValue));

  //void emitNextDay()
}
