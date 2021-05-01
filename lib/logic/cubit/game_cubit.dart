import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:price_of_reality/data/repositories/game.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/daily_situation_state.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  static final GameRepository gameRepository = GameRepository();

  final DailySituationCubit dailySituationCubit;
  late StreamSubscription _dailySituationSubscription;

  GameCubit({required this.dailySituationCubit})
      : super(GameState.GameWelcomeState) {
    _dailySituationSubscription =
        dailySituationCubit.stream.listen((dailySituationState) {
      if (dailySituationState is DailySituationFinishedState) {
        emit(GameState.GameEndingState);
      }
    });
  }

  void emitWelcomeGame() {
    emit(GameState.GameWelcomeState);
  }

  void emitStartGame() {
    dailySituationCubit.emitStart();
    emit(GameState.GameRunningState);
  }

  void emitNewGame() {
    dailySituationCubit.emitReset();
    emit(GameState.GameStartingState);
  }

  @override
  Future<void> close() {
    _dailySituationSubscription.cancel();
    return super.close();
  }

  @override
  GameState? fromJson(Map<String, dynamic> json) =>
      GameState.values[json['gamestate']];

  @override
  Map<String, dynamic>? toJson(GameState state) => {'gamestate': state.index};
}
