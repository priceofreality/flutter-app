import 'package:flutter/material.dart';
import 'package:price_of_reality/constants/routes.dart';
import 'package:price_of_reality/data/models/summary.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';
import 'package:price_of_reality/logic/cubit/game_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_of_reality/logic/cubit/transaction_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class EndGamePage extends StatelessWidget {
  void _launchURL(BuildContext context, String url) async =>
      await canLaunch(url)
          ? await launch(url)
          : showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) => AlertDialog(
                  title: Text(AppLocalizations.of(context)!.launchUrlError)));

  @override
  Widget build(BuildContext context) {
    final budget = context.read<TransactionCubit>().state.budget;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.endGameP1 + "\n",
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        baseline: TextBaseline.alphabetic,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 7.0, bottom: 7.0),
                          width: double.infinity,
                          child: InkWell(
                            child: Text(
                              "http://www.mediationdedettes.be",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.underline),
                            ),
                            onTap: () => _launchURL(context,
                                "http://www.mediationdedettes.be/La-boite-a-outils-de-mon-budget-Un-nouvel-outil-de-prevention-du-surendettement-611"),
                          ),
                        ),
                      ),
                      TextSpan(text: AppLocalizations.of(context)!.endGameP2),
                    ],
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
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
                  onPressed: () => Navigator.of(context).pushNamed(
                      TRANSACTIONS_PAGE,
                      arguments: Summary(
                          financialSituation: context
                              .read<FinancialSituationCubit>()
                              .state
                              .selected!,
                          transactions: context
                              .read<TransactionCubit>()
                              .state
                              .transactions)),
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
                  onPressed: () => context.read<GameCubit>().emitWelcomeGame(),
                  child: Text(
                    AppLocalizations.of(context)!.newgame.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
