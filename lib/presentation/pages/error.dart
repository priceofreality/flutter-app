import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  ErrorPage({this.message});

  @override
  Widget build(BuildContext context) {
    return Text(message ?? AppLocalizations.of(context).somethingWentWrong);
  }
}
