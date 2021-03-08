import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  static final DataProvider _instance = DataProvider._internal();

  factory DataProvider() => _instance;

  DataProvider._internal();

  Future<String> loadFinancialSituations() async =>
      await rootBundle.loadString('lib/data/db/financial_situations.json');

  Future<String> loadDailySituations() async =>
      await rootBundle.loadString('lib/data/db/daily_situations.json');

  Future<String> loadChoices() async =>
      await rootBundle.loadString('lib/data/db/choices.json');

  Future<String> loadChoicesSituations() async =>
      await rootBundle.loadString('lib/data/db/choice_daily_situation.json');

  Future<String> loadEvents() async =>
      await rootBundle.loadString('lib/data/db/events.json');
}
