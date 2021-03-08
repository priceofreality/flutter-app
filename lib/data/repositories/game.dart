import 'dart:async';
import 'dart:convert';

import 'package:projet4/data/providers/provider.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';

class GameRepository {
  // Map day : list of the situations of the day
  Map<int, List<DailySituation>> dailySituations = {};

  //List of financial situation
  List<FinancialSituation> financialSituations = [];

  int maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<Map<String, dynamic>> _mapChoices() {
    return _dataProvider.loadChoices().then((json) => jsonDecode(json));
  }

  Future<Map<String, dynamic>> _mapEvents() {
    return _dataProvider.loadEvents().then((json) => jsonDecode(json));
  }

  Future<List<dynamic>> _mapDailySituations() {
    return _dataProvider.loadDailySituations().then((json) => jsonDecode(json));
  }

  Future<List<dynamic>> _mapFinancialSituations() {
    return _dataProvider
        .loadFinancialSituations()
        .then((json) => jsonDecode(json));
  }

  Future<void> loadRepository() async {
    final futureChoices = _mapChoices();
    final futureEvents = _mapEvents();
    final futureFinancialSituations = _mapFinancialSituations();
    final futureDailySituations = _mapDailySituations();

    final eventsJson = await futureEvents;
    final choicesJson = await futureChoices;
    final dailySituationsJsonList = await futureDailySituations;

    List<DailySituation> situations = dailySituationsJsonList
        .map((dailyJson) =>
            DailySituation.fromJson(dailyJson, eventsJson, choicesJson))
        .toList();

    for (DailySituation situation in situations) {
      if (situation.day > maxDay) {
        maxDay = situation.day;
      }
      dailySituations.putIfAbsent(situation.day, () => []);
      dailySituations[situation.day]!.add(situation);
    }

    final financialSituationsJsonList = await futureFinancialSituations;

    financialSituations = financialSituationsJsonList
        .map((json) => FinancialSituation.fromJson(json))
        .toList();
  }
}
