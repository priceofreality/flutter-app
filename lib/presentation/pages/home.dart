import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/presentation/pages/daily_situation.dart';
import 'package:projet4/presentation/pages/end_game.dart';
import 'package:projet4/presentation/pages/start_game.dart';

enum Action { NewGame }

extension on Action {
  String get label {
    switch (this) {
      case Action.NewGame:
        return "New";
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Galette de ble'),
        actions: [
          PopupMenuButton<Action>(
            onSelected: (value) {
              switch (value) {
                case Action.NewGame:
                  return context.read<GameCubit>().emitNewGame();
              }
            },
            itemBuilder: (BuildContext context) {
              return Action.values.map((Action action) {
                return PopupMenuItem<Action>(
                  value: action,
                  child: Text(action.label),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<GameCubit, GameState>(
          builder: (context, state) {
            if (state is GameFinishedState) return EndGamePage();
            if (state is GameRunningState) return DailySituationPage();

            return StartGamePage();
          },
        ),
      ),
    );
  }
}
