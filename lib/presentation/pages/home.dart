import 'package:flutter/material.dart';
import 'package:projet4/constants/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FlatButton(
            onPressed: () => Navigator.of(context).pushNamed(COUNTER_PAGE),
            child: Text(AppLocalizations.of(context).toCounter),
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
