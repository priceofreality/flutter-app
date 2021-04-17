import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/constants/routes.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:price_of_reality/logic/cubit/onboard_cubit.dart';
import 'package:price_of_reality/presentation/pages/running_game.dart';
import 'package:price_of_reality/presentation/pages/end_game.dart';
import 'package:price_of_reality/presentation/pages/onboard.dart';
import 'package:price_of_reality/presentation/pages/start_game.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io';

enum Action { NewGame, Glossary, ExitGame }

extension on Action {
  String label(BuildContext context) {
    switch (this) {
      case Action.NewGame:
        return AppLocalizations.of(context)!.newgame;
      case Action.Glossary:
        return AppLocalizations.of(context)!.glossary;
      case Action.ExitGame:
        return AppLocalizations.of(context)!.exit;
    }
  }
}

class HomePage extends StatelessWidget {
  _goToGlossary(BuildContext context) => Navigator.of(context).pushNamed(
        GLOSSARY_PAGE,
      );

  _exitGame() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, bool?>(builder: (context, state) {
      if (state == null || state == true) {
        return OnBoardPage();
      }
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
                  case Action.Glossary:
                    return _goToGlossary(context);
                  case Action.ExitGame:
                    return _exitGame();
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
              if (state is GameRunningState) return RunningGamePage();

              return StartGamePage();
            },
          ),
        ),
      );
    });
  }
}
