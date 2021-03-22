part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  GameState();

  @override
  List<Object> get props => [];
}

class GameInitialState extends GameState {}

class GameRunningState extends GameState {}

class GameFinishedState extends GameState {}
