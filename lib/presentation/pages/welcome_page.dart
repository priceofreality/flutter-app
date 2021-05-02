import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              AppLocalizations.of(context)!.welcome,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.5),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 20.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: StadiumBorder(),
                primary: Theme.of(context).accentColor,
              ),
              onPressed: () => context.read<GameCubit>().emitNewGame(),
              child: Text(AppLocalizations.of(context)!.start.toUpperCase()),
            ),
          ),
        ],
      ),
    );
  }
}
