import 'dart:async';
import 'dart:convert';

import 'package:projet4/data/providers/provider.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/models/choice.dart';

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

  Future<List<Map<String, dynamic>>> _mapChoices() {
    return _dataProvider.loadChoices();
  }

  Future<List<Map<String, dynamic>>> _mapChoicesSituations() {
    return _dataProvider.loadChoiceDailySituations();
  }

  Future<List<Map<String, dynamic>>> _mapEvents() {
    return _dataProvider.loadEvents();
  }

  Future<List<Map<String, dynamic>>> _mapDailySituations() {
    return _dataProvider.loadDailySituations();
  }

  Future<List<Map<String, dynamic>>> _mapFinancialSituations() {
    return _dataProvider.loadFinancialSituations();
  }

  Future<List<Map<String, dynamic>>> _mapFinancialChoiceCosts(){
    return _dataProvider. loadFinancialChoiceCosts();
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
    final futureFinancialChoiceCost = _mapFinancialChoiceCosts();

    final eventsSql = await futureEvents;
    final choicesSql = await futureChoices;
    final dailySituationsSqlList = await futureDailySituations;
    final financialChoiceCosts = await futureFinancialChoiceCost;

    List events = eventsSql.map((event) => event['entitled']).toList();

    List<Choice> allChoices = choicesSql.map((choiceTuple) => Choice.fromTuple(choiceTuple, financialChoiceCosts)).toList();
    List<DailySituation> situations = dailySituationsSqlList
        .map((dailySql) =>
            DailySituation.fromTuple(dailySql, events, allChoices)).toList();

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
    final choicesSituationsSqlList = await futureChoicesSituations;

    for(Map<String, dynamic> choiceDailySituation in choicesSituationsSqlList){
      _choicesToDailySituation.putIfAbsent(choiceDailySituation['choice'], () => {});
      _choicesToDailySituation['choice']![choiceDailySituation['from_daily_situation']] = choiceDailySituation['to_daily_situation'];
    }

    final financialSituationsList = await futureFinancialSituations;

    financialSituations = financialSituationsList
        .map((sql) => FinancialSituation.fromTuple(sql))
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
