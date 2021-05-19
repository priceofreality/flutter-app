import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
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

enum Action { NewGame, Glossary, Onbaord, About, ExitGame }

Future<PackageInfo> _packageInfo = getPackageInfo();

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
        return AppLocalizations.of(context)!.onboard;
      case Action.About:
        return AppLocalizations.of(context)!.about;
    }
  }
}

Future<PackageInfo> getPackageInfo() async {
  return await PackageInfo.fromPlatform();
}

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: Text(AppLocalizations.of(context)!.about),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(AppLocalizations.of(context)!.aboutText),
        SizedBox(height: 20),
        Text(AppLocalizations.of(context)!.contact),
        SizedBox(height: 20),
        Text(
            "Contributeurs initiaux: Vincent BUCCILLI, Alexandre CLAES, Yann POLLET, Anthony VERRIEST, Marcin WILK, Emel ALAGOZ, Caroline DE BROUWER, Dorian PLAPP, Florine ROUSSELEAU, Vincent VEKEMAN"),
        SizedBox(height: 20),
        FutureBuilder<dynamic>(
          future: _packageInfo,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Text(
                  AppLocalizations.of(context)!.version(snapshot.data.version));
            } else {
              return Text(AppLocalizations.of(context)!.version(""));
            }
          },
        ),
      ],
    ),
    actions: <Widget>[
      new TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(AppLocalizations.of(context)!.close),
      ),
    ],
  );
}

class HomePage extends StatelessWidget {
  _goToGlossary(BuildContext context) => Navigator.of(context).pushNamed(
        GLOSSARY_PAGE,
      );

  _exitGame() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    exit(0);
  }

  _aboutPopup(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) => _buildPopupDialog(context),
      );

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
                  case Action.About:
                    return _aboutPopup(context);
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
