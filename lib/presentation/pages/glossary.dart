import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:price_of_reality/data/repositories/game.dart';

class GlossaryPage extends StatelessWidget {
  final GameRepository gameRepository = GameRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.glossary),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Text(
                      gameRepository.glossary[index].label,
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0, bottom: 10.0),
                  child: Text(
                    gameRepository.glossary[index].definition,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                if (index < gameRepository.glossary.length - 1)
                  Divider(
                    thickness: 1.5,
                    color: Theme.of(context).buttonColor,
                  ),
              ],
            );
          },
          itemCount: gameRepository.glossary.length,
        ),
      ),
    );
  }
}
