import 'package:flutter/material.dart';
import 'package:price_of_reality/constants/routes.dart';
import 'package:price_of_reality/data/models/summary.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EndGamePage extends StatelessWidget {
  //TODO ADD COFNFETTIII
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text(
              "Et voilà, vous venez de terminer le prix de la réalité. Comme vous avez pu le constater, il est difficile de gérer un budget, et plus encore pour certains types de situations. C'est pourquoi en Belgique, il existe des institutions qui ont pour but de venir en aide aux ménages et personnes qui ont des difficultés financières. Cliquez ici pour les découvrir ! (Liens qui vont vers les descriptions de chaque institution : service de médiation de dettes, Actiris, CPAS, CAPAC, mutuelle et ONEM.",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: StadiumBorder(),
                primary: Theme.of(context).accentColor,
              ),
              onPressed: () => Navigator.of(context).pushNamed(
                  TRANSACTIONS_PAGE,
                  arguments: Summary(
                      initialBudget: context
                          .read<FinancialSituationCubit>()
                          .state
                          .selected!
                          .initialBudget,
                      transactions:
                          context.read<TransactionCubit>().state.transactions)),
              child: Text(
                AppLocalizations.of(context)!.summary.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: StadiumBorder(),
                primary: Theme.of(context).accentColor,
              ),
              onPressed: () => context.read<GameCubit>().emitNewGame(),
              child: Text(
                AppLocalizations.of(context)!.newgame.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
