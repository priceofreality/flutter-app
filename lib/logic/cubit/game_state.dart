part of 'game_cubit.dart';

enum GameStateType { Initial, Running, Finished }

class GameState extends BlocState<GameStateType> {
  GameState() : super(GameStateType.Initial);

  GameState.finished() : super(GameStateType.Finished);

  @override
  List<Object> get props => [];
}
