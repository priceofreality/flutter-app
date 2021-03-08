import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:projet4/logic/cubit/daily_situation_cubit.dart';
import 'package:projet4/logic/cubit_state.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final DailySituationCubit dailySituationCubit;
  late StreamSubscription _dailySituationSubscription;

  GameCubit({required this.dailySituationCubit}) : super(GameState()) {
    _dailySituationSubscription =
        dailySituationCubit.listen((dailySituationState) {
      print(dailySituationState.type);
      if (dailySituationState.type == DailySituationStateType.Finished) {
        print('FINISHED');
        emit(GameState.finished());
      }
    });
  }

  @override
  Future<void> close() {
    _dailySituationSubscription.cancel();
    return super.close();
  }
}
