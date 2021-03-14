import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projet4/data/repositories/game.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  static final GameRepository gameRepository = GameRepository();
  final DailySituationCubit dailySituationCubit;
  late StreamSubscription _dailySituationSubscription;

  final initialBudget = gameRepository.financialSituations[0].budget;

  GameCubit({required this.dailySituationCubit}) : super(GameInitialState()) {
    dailySituationCubit.emitFinancialSituation(
        gameRepository.financialSituations[0]); //LOAD SCREEN

    _dailySituationSubscription =
        dailySituationCubit.listen((dailySituationState) {
      if (dailySituationState is DailySituationFinishedState) {
        emit(GameFinishedState());
      }
    });
  }

  void emitStartGame() {
    //add selections
    emit(GameRunningState());
  }

  void emitNewGame() {
    emit(GameInitialState());
    dailySituationCubit
        .emitFinancialSituation(gameRepository.financialSituations[0]);
    dailySituationCubit.emitReset();
  }

  @override
  Future<void> close() {
    _dailySituationSubscription.cancel();
    return super.close();
  }
}
