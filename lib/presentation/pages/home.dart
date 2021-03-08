import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/presentation/pages/daily_situation.dart';
import 'package:projet4/presentation/pages/end_game.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return (state.type == GameStateType.Finished)
              ? EndGamePage()
              : DailySituationPage();
        },
      )),
    );
  }
}
