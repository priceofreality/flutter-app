import 'package:flutter/material.dart';
import 'package:projet4/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EndGamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('FIN DU JEU'),
              TextButton(
                child: Text('Nouvelle partie'),
                onPressed: () => context.read<GameCubit>().emitNewGame(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
