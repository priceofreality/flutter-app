import 'dart:async';

import 'package:projet4/data/db/options.dart';
import 'package:projet4/data/models/additional_charge.dart';
import 'package:projet4/data/models/family_situation.dart';
import 'package:projet4/data/models/option_situation.dart';
import 'package:projet4/data/models/user.dart';
import 'package:projet4/data/providers/provider.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/models/choice.dart';

class GameRepository {
  List<FinancialSituation> _financialSituations = [];
  List<FamilySituation> _familySituations = [];
  List<OptionSituation> _optionSituations = [];

  Map<int, List<DailySituation>> _dailySituationsPerDay = {};
  Map<int, DailySituation> _lockedDailySituations = {};

  Map<int, List<Choice>> _choicesOfDailySituation = {};
  Map<Choice, Map<Option, AdditionalCharge>> _additionalChargesOfChoice = {};

  int _maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<void> loadRepository() async {
    final futureChoices = _dataProvider.loadChoices();
    final futureEvents = _dataProvider.loadEvents();
    final futureDailySituations = _dataProvider.loadChoices();
    final futureOptions = _dataProvider.loadOptions();
    final futureDailySituationChoices = _dataProvider.loadChoices();
    final futureAdditionalCharges = _dataProvider.loadAdditionalCharges();

    final choicesSql = await futureChoices;
    final eventsSql = await futureEvents;
    final dailySituationsSql = await futureDailySituations;
    final dailySituationchoicesSql = await futureDailySituationChoices;
    final optionsSql = await futureOptions;
    final additionalChargesSql = await futureAdditionalCharges;

    Map<int, String> events = Map.fromIterable(eventsSql,
        key: (e) => e['id'], value: (e) => e['label']);

    Map<int, String> choices = Map.fromIterable(choicesSql,
        key: (e) => e['id'], value: (e) => e['label']);

    List<DailySituation> dailySituations = dailySituationsSql
        .map((e) => DailySituation.fromTuple(e, events))
        .toList();

    for (var option in optionsSql) {
      if (option['situation'] == Situation.FamilySituation)
        _familySituations.add(FamilySituation.fromTuple(option));
      else if (option['situation'] == Situation.FinancialSituation)
        _financialSituations.add(FinancialSituation.fromTuple(option));
      else if (option['situation'] == Situation.OptionSituation)
        _optionSituations.add(OptionSituation.fromTuple(option));
    }

    for (var daily in dailySituations) {
      if (daily.day > _maxDay) _maxDay = daily.day;

      if (daily.locked) {
        _lockedDailySituations[daily.id] = daily;
      } else {
        _dailySituationsPerDay.putIfAbsent(daily.day, () => []);
        _dailySituationsPerDay[daily.day]!.add(daily);
      }
    }

    for (var choice in dailySituationchoicesSql) {
      _choicesOfDailySituation.putIfAbsent(choice['daily_situation'], () => []);
      _choicesOfDailySituation[choice['daily_situation']]!
          .add(Choice.fromTuple(choice, choices));
    }

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
  }

  void unlockDailySituation(Choice choice) {
    DailySituation unlocked = _lockedDailySituations[choice.unlock]!;
    _dailySituationsPerDay[unlocked.day]!.add(unlocked);
  }

  void unlockDailySituationByOptions(User user) {
    for (var unlocked in _lockedDailySituations.values) {
      for (var option in Option.values) {
        if (user.status & Option.Isolated.index == option.index) {
          _dailySituationsPerDay[unlocked.day]!.add(unlocked);
        }
        if (user.status & Option.SingleParentFamily.index == option.index) ;
        //TODO
      }
    }
  }

  List<DailySituation>? getDailySituationsOfDay(int day) =>
      _dailySituationsPerDay[day];

  List<Choice> getChoicesOfDailySituation(
    User user,
    int dailysituation,
  ) {
    for (var choice in _choicesOfDailySituation[dailysituation]!) {
      for (var option in Option.values) {
        if (user.status & Option.Isolated.index == option.index) {
          double charge = _additionalChargesOfChoice[choice]![option]!.charge;
          choice.minCost += charge;
        }
        if (user.status & Option.SingleParentFamily.index == option.index) ;
        //TODO
      }
    }

    return _choicesOfDailySituation[dailysituation]!;
  }

  List<FamilySituation> get familySituations => _familySituations;

  List<FinancialSituation> get financialSituations => _financialSituations;

  List<OptionSituation> get optionSituations => _optionSituations;
}
