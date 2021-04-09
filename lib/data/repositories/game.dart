import 'dart:async';

import 'package:price_of_reality/data/db/options.dart' as options;
import 'package:price_of_reality/data/models/additional_charge.dart';
import 'package:price_of_reality/data/models/option_situation.dart';
import 'package:price_of_reality/data/providers/provider.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/financial_choice_cost.dart';

class GameRepository {
  late List<FinancialSituation> _financialSituations;
  late List<OptionSituation> _optionSituations;

  late Map<int, List<DailySituation>> _dailySituationsPerDay;
  late Map<int, DailySituation> _lockedDailySituations;

  // dailySituation => daily_situation_choices
  late Map<int, List<Choice>> _choicesOfDailySituation;

  //dailySituationChoice => financialId => cout
  late Map<int, Map<int, FinancialChoiceCost>> _financialChoicesCosts;

  /* ITERATION 3
  Map<Choice, Map<options.Option, AdditionalCharge>>
      _additionalChargesOfChoice = {};
  */

  int maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<void> loadRepository() async {
    print("load");
    _financialSituations = [];
    _optionSituations = [];
    _dailySituationsPerDay = {};
    _lockedDailySituations = {};
    _choicesOfDailySituation = {};
    _financialChoicesCosts = {};

    final futureFinancialSituations = _dataProvider.loadFinancialSituations();
    final futureFinancialChoiceCosts = _dataProvider.loadFinancialChoicesCost();
    final futureChoices = _dataProvider.loadChoices();
    final futureEvents = _dataProvider.loadEvents();
    final futureDailySituations = _dataProvider.loadDailySituations();
    //final futureOptions = _dataProvider.loadOptions();
    final futureDailySituationChoices =
        _dataProvider.loadDailySituationChoices();

    /* ITERATION 3
    final futureAdditionalCharges = _dataProvider.loadAdditionalCharges();
    */

    final financialSituationsSql = await futureFinancialSituations;
    final financialChoiceCostsSql = await futureFinancialChoiceCosts;
    final choicesSql = await futureChoices;
    final eventsSql = await futureEvents;
    final dailySituationsSql = await futureDailySituations;
    final dailySituationChoicesSql = await futureDailySituationChoices;
    //final optionsSql = await futureOptions;

    /* ITERATION 3
    final additionalChargesSql = await futureAdditionalCharges;
    */

    print("events");

    Map<int, String> events = Map.fromIterable(eventsSql,
        key: (e) => e['id'], value: (e) => e['label']);

    print("choices");

    Map<int, String> choices = Map.fromIterable(choicesSql,
        key: (e) => e['id'], value: (e) => e['label']);

    List<DailySituation> dailySituations = dailySituationsSql
        .map((e) => DailySituation.fromTuple(e, events))
        .toList();
    print("DailySituations : ${dailySituations.length}");
    /*
    for (var option in optionsSql) {
      _optionSituations.add(OptionSituation.fromTuple(option));
    }
    */

    for (var financialSituation in financialSituationsSql) {
      _financialSituations
          .add(FinancialSituation.fromTuple(financialSituation));
    }
    print("FinancialSituation : ${_financialSituations.length}");

    for (var daily in dailySituations) {
      if (daily.day > maxDay) maxDay = daily.day;

      if (daily.locked) {
        _lockedDailySituations[daily.id] = daily;
      } else {
        _dailySituationsPerDay.putIfAbsent(daily.day, () => []);
        _dailySituationsPerDay[daily.day]!.add(daily);
      }
    }
    print("Maxday = $maxDay");
    print("daily situation per day ${_dailySituationsPerDay.length}");
    print("locked daily situation ${_lockedDailySituations.length}");

    Map<int, Choice> dailySituationChoicesMap = {};
    for (var choice in dailySituationChoicesSql) {
      Choice choiceInstance = Choice.fromTuple(choice, choices);
      dailySituationChoicesMap[choiceInstance.id] = choiceInstance;

      _choicesOfDailySituation.putIfAbsent(choice['daily_situation'], () => []);
      _choicesOfDailySituation[choice['daily_situation']]!.add(choiceInstance);
    }
    print("dailySituationChoices = ${dailySituationChoicesMap.length}");

    /* ITERATION 3
    for (var charge in additionalChargesSql) {
      List<Choice> tmp = _choicesOfDailySituation[charge['daily_situation']]!;
      for (var choice in tmp) {
        if (choice.id == charge['choice']) {
          _additionalChargesOfChoice.putIfAbsent(choice, () => {});
          _additionalChargesOfChoice[choice]![charge['option']] =
              AdditionalCharge.fromTuple(charge);
        }
      }
    }
    */
    /*
      financial_situation INTEGER NOT NULL,
      choice INTEGER NOT NULL,
      daily_situation INTEGER NOT NULL,
      cost_min DOUBLE NOT NULL,
      cost_max DOUBLE,
      PRIMARY KEY (choice, financial_situation)
    */
    //_financialChoicesCosts

    // daily Sit -> Choice -> dailySituationChoice
    for (var cost in financialChoiceCostsSql) {
      Choice choice = dailySituationChoicesMap[cost['daily_choice']]!;

      _financialChoicesCosts.putIfAbsent(choice.id, () => {});
      _financialChoicesCosts[choice.id]![cost['financial_situation']] =
          FinancialChoiceCost(
              minCost: cost['min_cost'], maxCost: cost['max_cost']);
    }
    print("financialChoiceCostsSql = ${financialChoiceCostsSql.length}");
  }

  void unlockDailySituation(Choice choice) {
    if (choice.unlockDailySituation != null) {
      for (int unlock in choice.unlockDailySituation!) {
        DailySituation unlocked = _lockedDailySituations[unlock]!;

        _dailySituationsPerDay.putIfAbsent(unlocked.day, () => []);
        _dailySituationsPerDay[unlocked.day]!.add(unlocked);
      }
    }
  }

  /* ITERATION 3
  void unlockDailySituationByOptions(User user) {
    for (var unlocked in _lockedDailySituations.values) {
      for (var option in options.FamilySituation.values) {
        if (user.status & options.FamilySituation.Isolated.index ==
            option.index) {
          _dailySituationsPerDay[unlocked.day]!.add(unlocked);
        }
        if (user.status & options.FamilySituation.SingleParentFamily.index ==
            option.index) ;
        //TODO
      }
    }
  }
  */

  List<DailySituation>? getDailySituationsOfDay(int day) =>
      _dailySituationsPerDay[day];

  Set<Choice> getChoicesOfDailySituation(
      int financialSituation, int dailysituation) {
    print("start get choices");
    for (var choice in _choicesOfDailySituation[dailysituation]!) {
      print(choice.label);
      if (_financialChoicesCosts[choice.id] != null) {
        if (_financialChoicesCosts[choice.id]![financialSituation] != null) {
          FinancialChoiceCost financialChoiceCost =
              _financialChoicesCosts[choice.id]![financialSituation]!;

          choice.minCost = financialChoiceCost.minCost;
          choice.maxCost = financialChoiceCost.maxCost;
          print("min = ${choice.minCost}; max = ${choice.maxCost}");
        }
      }
    }
    print("end get choices");

    return _choicesOfDailySituation[dailysituation]!.toSet();
  }

  /* ITERATION 3
  List<Choice> getChoicesOfDailySituation(
    User user,
    int dailysituation,
  ) {
    for (var choice in _choicesOfDailySituation[dailysituation]!) {
      for (var option in options.FamilySituation.values) {
        if (user.status & options.FamilySituation.Isolated.index ==
            option.index) {
          double charge = _additionalChargesOfChoice[choice]![option]!.charge;
          choice.minCost += charge;
        }
        if (user.status & options.FamilySituation.SingleParentFamily.index ==
            option.index) ;
        //TODO
      }
    }

    return _choicesOfDailySituation[dailysituation]!;
  }
  */

  //List<FamilySituation> get familySituations => _familySituations;

  List<FinancialSituation> get financialSituations => _financialSituations;

//  List<OptionSituation> get optionSituations => _optionSituations;
}
