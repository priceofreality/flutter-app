import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/presentation/pages/daily_situation.dart';
import 'package:projet4/presentation/pages/end_game.dart';
import 'package:projet4/presentation/pages/start_game.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text('Galette de ble'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_vert),
            ),
          ),
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
