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

import 'package:price_of_reality/presentation/pages/welcome_page.dart';

enum Action { NewGame, Glossary, Onbaord, ExitGame }

extension on Action {
  String label(BuildContext context) {
    switch (this) {
      case Action.NewGame:
        return AppLocalizations.of(context)!.newgame;
      case Action.Glossary:
        return AppLocalizations.of(context)!.glossary;
      case Action.ExitGame:
        return AppLocalizations.of(context)!.exit;
      case Action.Onbaord:
        return 'TODO'; //AppLocalizations.of(context)!.exit;
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
                    return context.read<GameCubit>().emitWelcomeGame();
                  case Action.Glossary:
                    return _goToGlossary(context);
                  case Action.ExitGame:
                    return _exitGame();
                  case Action.Onbaord:
                    return context.read<OnboardCubit>().emitFirstLoad(true);
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
              switch (state) {
                case GameState.GameWelcomeState:
                  return WelcomePage();
                case GameState.GameStartingState:
                  return StartGamePage();
                case GameState.GameRunningState:
                  return RunningGamePage();
                case GameState.GameEndingState:
                  return EndGamePage();
              }
            },
          ),
        ),
      );
    });
  }
}
