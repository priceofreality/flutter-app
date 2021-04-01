import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:price_of_reality/presentation/pages/daily_situation.dart';
import 'package:price_of_reality/presentation/pages/end_game.dart';
import 'package:price_of_reality/presentation/pages/start_game.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';

enum Action { NewGame, ExitGame }

extension on Action {
  String label(BuildContext context) {
    switch (this) {
      case Action.NewGame:
        return AppLocalizations.of(context)!.newgame;
      case Action.ExitGame:
        return AppLocalizations.of(context)!.exit;
    }
  }
}

exitGame() async {
  await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  exit(0);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(AppLocalizations.of(context)!.title),
        actions: [
          PopupMenuButton<Action>(
            onSelected: (value) {
              switch (value) {
                case Action.NewGame:
                  return context.read<GameCubit>().emitNewGame();
                case Action.ExitGame:
                  return exitGame();
              }
            },
            itemBuilder: (BuildContext context) {
              return Action.values.map((Action action) {
                return PopupMenuItem<Action>(
                  value: action,
                  child: Text(action.label(context)),
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
