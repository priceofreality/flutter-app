import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GlossaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titles = [
      AppLocalizations.of(context)!.actiris,
      AppLocalizations.of(context)!.debtMediationService,
      AppLocalizations.of(context)!.neo,
      AppLocalizations.of(context)!.capac,
      AppLocalizations.of(context)!.ocmw,
      AppLocalizations.of(context)!.insurance
    ];

    final definitions = [
      AppLocalizations.of(context)!.actirisDef,
      AppLocalizations.of(context)!.debtMediationServiceDef,
      AppLocalizations.of(context)!.neoDef,
      AppLocalizations.of(context)!.capacDef,
      AppLocalizations.of(context)!.ocmwDef,
      AppLocalizations.of(context)!.insuranceDef
    ];

    assert(titles.length == definitions.length);

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
                      titles[index],
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0, bottom: 10.0),
                  child: Text(
                    definitions[index],
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                if (index < titles.length - 1)
                  Divider(
                    thickness: 1.5,
                    color: Theme.of(context).buttonColor,
                  ),
              ],
            );
          },
          itemCount: titles.length,
        ),
      ),
    );
  }
}
/*

padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 15.0),
          children: [
            Center(
              child: Text(
                AppLocalizations.of(context)!.actiris,
                style: title,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: Text(AppLocalizations.of(context)!.actirisDef),
            ),
            Divider(
              thickness: 2,
            ),
            Text(AppLocalizations.of(context)!.debtMediationService),
            Text(AppLocalizations.of(context)!.debtMediationServiceDef),
            Divider(thickness: 2),
            Text(AppLocalizations.of(context)!.neo),
            Text(AppLocalizations.of(context)!.neoDef),
            Divider(thickness: 2),
            Text(AppLocalizations.of(context)!.capac),
            Text(AppLocalizations.of(context)!.capacDef),
            Divider(thickness: 2),
            Text(AppLocalizations.of(context)!.ocmw),
            Text(AppLocalizations.of(context)!.ocmwDef),
            Divider(thickness: 2),
            Text(AppLocalizations.of(context)!.insurance),
            Text(AppLocalizations.of(context)!.insuranceDef),
          ],

          */
