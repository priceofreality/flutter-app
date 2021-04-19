import 'dart:async';

import 'package:price_of_reality/data/models/additional_charge.dart';
import 'package:price_of_reality/data/models/definition.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/providers/provider.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/financial_choice_cost.dart';

class GameRepository {
  late List<Definition> glossary;
  late Map<OptionGroup, List<Option>> optionsPerGroup;
  late List<FinancialSituation> financialSituations;

  //key: day
  late Map<int, List<DailySituation>> _dailySituationsPerDay;
  //key: daily_situation id
  late Map<int, DailySituation> _lockedDailySituations;
  //key: financial_situation id
  late Map<int, List<DailySituation>> _financialDailySituations;
  //key: option id
  late Map<int, List<DailySituation>> _optionDailySituation;
  //key: daily_situation id
  late Map<int, List<Choice>> _choicesOfDailySituation;
  //key: daily_situation_choice id => key: financial_situation id
  late Map<int, Map<int, FinancialChoiceCost>> _financialChoicesCosts;
  //key: daily_situation_choice id
  late Map<int, List<AdditionalCharge>> _additionalChargesOfChoice;

  int maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<void> loadRepository() async {
    optionsPerGroup = {};

    _dailySituationsPerDay = {};
    _lockedDailySituations = {};
    _choicesOfDailySituation = {};
    _financialChoicesCosts = {};
    _additionalChargesOfChoice = {};
    _financialDailySituations = {};
    _optionDailySituation = {};

    final financialSituationsSql =
        await _dataProvider.loadFinancialSituations();
    final financialChoiceCostsSql =
        await _dataProvider.loadFinancialChoicesCost();
    final choicesSql = await _dataProvider.loadChoices();
    final eventsSql = await _dataProvider.loadEvents();
    final dailySituationsSql = await _dataProvider.loadDailySituations();
    final dailySituationChoicesSql =
        await _dataProvider.loadDailySituationChoices();
    final unlockDailySituationsSql =
        await _dataProvider.loadUnlockDailySituations();
    final financialDailySituationsSql =
        await _dataProvider.loadFinancialDailySituations();
    final glossarySql = await _dataProvider.loadGlossary();
    final optionsSql = await _dataProvider.loadOptions();
    final optionGroupsSql = await _dataProvider.loadOptionGroups();
    final optionDailySituationsSql =
        await _dataProvider.loadOptionDailySituations();
    final additionalChargesSql = await _dataProvider.loadAdditionalCharges();

    glossary = glossarySql.map((d) => Definition.fromTuple(d)).toList();

    Map<int, String> events = Map.fromIterable(eventsSql,
        key: (e) => e['id'], value: (e) => e['label']);

    Map<int, String> choices = Map.fromIterable(choicesSql,
        key: (e) => e['id'], value: (e) => e['label']);

    Map<int, OptionGroup> optionGroups = Map.fromIterable(optionGroupsSql,
        key: (e) => e['id'], value: (e) => OptionGroup.fromTuple(e));

    List<DailySituation> dailySituations = dailySituationsSql
        .map((e) => DailySituation.fromTuple(e, events))
        .toList();

    financialSituations = List.from(
        financialSituationsSql.map((e) => FinancialSituation.fromTuple(e)));

    Map<int, Option> options = {};

    for (var tuple in optionsSql) {
      Option option = Option.fromTuple(tuple, optionGroups);

      optionsPerGroup.putIfAbsent(option.optionGroup, () => []);
      optionsPerGroup[option.optionGroup]!.add(option);

      options[option.id] = option;
    }

    //key: daily_situation id, value: list financial_situations id
    Map<int, List<int>> financialDailySituations = {};

    for (var tuple in financialDailySituationsSql) {
      financialDailySituations.putIfAbsent(tuple['daily_situation'], () => []);

      financialDailySituations[tuple['daily_situation']]!
          .add(tuple['financial_situation']);
    }

    //key : daily_situation id, value : list option id
    Map<int, List<int>> optionDailySituations = {};

    for (var tuple in optionDailySituationsSql) {
      optionDailySituations.putIfAbsent(tuple['daily_situation'], () => []);

      optionDailySituations[tuple['daily_situation']]!.add(tuple['option']);
    }

    //key : daily_situation_choice id, value : list of daily_situation id to unlock
    Map<int, List<int>> unlockDailySituations = {};
    for (var unlock in unlockDailySituationsSql) {
      unlockDailySituations.putIfAbsent(
          unlock['daily_situation_choice'], () => []);
      unlockDailySituations[unlock['daily_situation_choice']]!
          .add(unlock['daily_situation']);
    }

    for (var daily in dailySituations) {
      if (daily.day > maxDay) maxDay = daily.day;

      // if the dailySituation depends on the financial one
      if (financialDailySituations[daily.id] != null ||
          optionDailySituations[daily.id] != null) {
        if (financialDailySituations[daily.id] != null) {
          financialDailySituations[daily.id]!.forEach((f) {
            _financialDailySituations.putIfAbsent(f, () => []);
            _financialDailySituations[f]!.add(daily);
          });
        }
        if (optionDailySituations[daily.id] != null) {
          optionDailySituations[daily.id]!.forEach((f) {
            _optionDailySituation.putIfAbsent(f, () => []);
            _optionDailySituation[f]!.add(daily);
          });
        }
      } else if (daily.locked) {
        // if the dailySituation is locked
        _lockedDailySituations[daily.id] = daily;
      } else {
        // if the dailySituation should always appear
        _dailySituationsPerDay.putIfAbsent(daily.day, () => []);
        _dailySituationsPerDay[daily.day]!.add(daily);
      }
    }

    //key: choice id
    Map<int, Choice> dailySituationChoices = {};

    for (var tuple in dailySituationChoicesSql) {
      Choice choice = Choice.fromTuple(tuple, choices, unlockDailySituations);
      dailySituationChoices[choice.id] = choice;

      _choicesOfDailySituation.putIfAbsent(tuple['daily_situation'], () => []);
      _choicesOfDailySituation[tuple['daily_situation']]!.add(choice);
    }

    for (var tuple in financialChoiceCostsSql) {
      Choice choice = dailySituationChoices[tuple['daily_situation_choice']]!;

      _financialChoicesCosts.putIfAbsent(choice.id, () => {});

      _financialChoicesCosts[choice.id]![tuple['financial_situation']] =
          FinancialChoiceCost(
              minCost: tuple['min_cost'], maxCost: tuple['max_cost']);
    }

    for (var tuple in additionalChargesSql) {
      _additionalChargesOfChoice.putIfAbsent(
          tuple['daily_situation_choice'], () => []);

      _additionalChargesOfChoice[tuple['daily_situation_choice']]!.add(
          AdditionalCharge.fromTuple(tuple, options, dailySituationChoices));
    }
  }

  void unlockDailyFinancialSituations(int financialSituation) {
    if (_financialDailySituations[financialSituation] == null) return;
    for (var daily in _financialDailySituations[financialSituation]!) {
      if (daily.locked) {
        // if the dailySituation is locked
        _lockedDailySituations[daily.id] = daily;
      } else {
        // if the dailySituation should always appear
        _dailySituationsPerDay.putIfAbsent(daily.day, () => []);
        _dailySituationsPerDay[daily.day]!.add(daily);
      }
    }
  }

  void unlockDailyOptionSituations(int option) {
    if (_optionDailySituation[option] == null) return;
    for (var daily in _optionDailySituation[option]!) {
      if (daily.locked) {
        // if the dailySituation is locked
        _lockedDailySituations[daily.id] = daily;
      } else {
        // if the dailySituation should always appear
        _dailySituationsPerDay.putIfAbsent(daily.day, () => []);
        _dailySituationsPerDay[daily.day]!.add(daily);
      }
    }
  }

  void delockDailySituation(Choice choice) {
    if (choice.unlockDailySituation != null) {
      for (int unlock in choice.unlockDailySituation!) {
        DailySituation alreadyUnlocked = _lockedDailySituations[unlock]!;
        _dailySituationsPerDay[alreadyUnlocked.day]!.remove(alreadyUnlocked);
      }
    }
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

  List<DailySituation>? getDailySituationsOfDay(int day) =>
      _dailySituationsPerDay[day];

  Set<Choice> getChoicesOfDailySituation(
      int financialSituation, int dailysituation, List<Option> options) {
    for (var choice in _choicesOfDailySituation[dailysituation]!) {
      print(choice.label);
      if (_financialChoicesCosts[choice.id] != null) {
        if (_financialChoicesCosts[choice.id]![financialSituation] != null) {
          double charge = 0;
          // Add the additional charge
          if (_additionalChargesOfChoice[choice.id] != null) {
            for (AdditionalCharge tuple
                in _additionalChargesOfChoice[choice.id]!) {
              if (options.contains(tuple.option)) {
                charge += tuple.charge;
              }
            }
          }
          FinancialChoiceCost financialChoiceCost =
              _financialChoicesCosts[choice.id]![financialSituation]!;

          choice.minCost = financialChoiceCost.minCost + charge;
          choice.maxCost = (financialChoiceCost.maxCost == null)
              ? null
              : financialChoiceCost.maxCost! + charge;
        }
      }
    }

    return _choicesOfDailySituation[dailysituation]!.toSet();
  }
}
