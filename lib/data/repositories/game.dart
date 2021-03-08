import 'dart:async';
import 'dart:convert';

import 'package:projet4/data/providers/provider.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';

class GameRepository {
  // Map day : list of the situations of the day
  late Map<int, List<DailySituation>> dailySituations;
  late Map<int, DailySituation> _dailySituationLocked;
  // Private map of choices -> dailySituations
  late Map<int, Map<int, int>> _choicesToDailySituation;

  //List of financial situation
  late List<FinancialSituation> financialSituations;

  int maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<Map<String, dynamic>> _mapChoices() {
    return _dataProvider.loadChoices().then((json) => jsonDecode(json));
  }

  Future<Map<String, dynamic>> _mapChoicesSituations() {
    return _dataProvider
        .loadChoicesSituations()
        .then((json) => jsonDecode(json));
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
    dailySituations = {};
    _dailySituationLocked = {};
    _choicesToDailySituation = {};
    financialSituations = [];

    final futureChoices = _mapChoices();
    final futureEvents = _mapEvents();
    final futureFinancialSituations = _mapFinancialSituations();
    final futureDailySituations = _mapDailySituations();
    final futureChoicesSituations = _mapChoicesSituations();

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
      if (situation.locked) {
        _dailySituationLocked[situation.id] = situation;
      } else {
        dailySituations.putIfAbsent(situation.day, () => []);
        dailySituations[situation.day]!.add(situation);
      }
    }

    // load the ChoicesSituations
    final choicesSituationsJsonList = await futureChoicesSituations;

    _choicesToDailySituation =
        choicesSituationsJsonList.map((situationId, value) {
      final jsonMap = Map<String, int>.from(value);

      return MapEntry(
          int.parse(situationId),
          jsonMap.map(
              (situation2Id, id) => MapEntry(int.parse(situation2Id), id)));
    });

    final financialSituationsJsonList = await futureFinancialSituations;

    financialSituations = financialSituationsJsonList
        .map((json) => FinancialSituation.fromJson(json))
        .toList();
  }

  void unlockDailySituation(int choice, int firstSituation) {
    if (_choicesToDailySituation[choice] != null) {
      if (_choicesToDailySituation[choice]![firstSituation] != null) {
        int situationId = _choicesToDailySituation[choice]![firstSituation]!;
        DailySituation situation = _dailySituationLocked[situationId]!;
        dailySituations.putIfAbsent(situation.day, () => []);
        dailySituations[situation.day]!.add(situation);
      }
    }
  }
}
