part of 'game_cubit.dart';

enum GameStateType { Initial, Running, Finished }

class GameState extends BlocState<GameStateType> {
  GameState.initial() : super(GameStateType.Initial);

  GameState.finish() : super(GameStateType.Finished);

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {
  GameInitialState() : super.initial();
}

class GameFinishedState extends GameState {
  GameFinishedState() : super.finish();
}
