part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  GameState.initial() : super();

  GameState.finish() : super();

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {
  GameInitialState() : super.initial();
}

class GameFinishedState extends GameState {
  GameFinishedState() : super.finish();
}
