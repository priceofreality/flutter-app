import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projet4/constants/routes.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:projet4/presentation/pages/daily_situation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          return (state.type == GameStateType.Finished)
              ? Text('EEEEEE')
              : DailySituationPage();
        },
      )),
    );
  }
}

/*

listener: (context, state) {
            if (state.type == GameStateType.Finished) {
              print('')
              Navigator.of(context).pushNamed(END_PAGE);
            }
          },
          child: DailySituationPage(),

          */
