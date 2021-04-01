import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/repositories/game.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_cubit.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  static final GameRepository gameRepository = GameRepository();
  final DailySituationCubit dailySituationCubit;
  late StreamSubscription _dailySituationSubscription;

  GameCubit({required this.dailySituationCubit}) : super(GameInitialState()) {
    _dailySituationSubscription =
        dailySituationCubit.stream.listen((dailySituationState) {
      if (dailySituationState is DailySituationFinishedState) {
        emit(GameFinishedState());
      }
    });
  }

  void emitStartGame() {
    //add selections
    dailySituationCubit.emitStart();
    emit(GameRunningState());
  }

  void emitNewGame() {
    emit(GameInitialState());
    dailySituationCubit.emitReset();
  }

  @override
  Future<void> close() {
    _dailySituationSubscription.cancel();
    return super.close();
  }
}
