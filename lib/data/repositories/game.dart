import 'dart:async';

import 'package:price_of_reality/data/models/additional_charge.dart';
import 'package:price_of_reality/data/models/definition.dart';
import 'package:price_of_reality/data/models/option_group.dart';
import 'package:price_of_reality/data/models/option.dart';
import 'package:price_of_reality/data/models/option_situation.dart';
import 'package:price_of_reality/data/providers/provider.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/financial_choice_cost.dart';

class GameRepository {
  late List<FinancialSituation> _financialSituations;
  // Group.id -> options
  late Map<OptionGroup, List<Option>>
      _optionsPerGroup; //if group == null, key = -1;

  late Map<int, List<DailySituation>> _dailySituationsPerDay;
  late Map<int, DailySituation> _lockedDailySituations;
  late Map<int, List<DailySituation>> _financialDailySituations;
  late Map<int, List<DailySituation>> _optionDailySituation;

  // dailySituation => daily_situation_choices
  late Map<int, List<Choice>> _choicesOfDailySituation;

  //dailySituationChoice => financialId => cout
  late Map<int, Map<int, FinancialChoiceCost>> _financialChoicesCosts;

  late List<Definition> _definitions;

  // choice.id => additional charge
  Map<int, List<AdditionalCharge>> _additionalChargesOfChoice = {};

  int maxDay = -1;

  DataProvider _dataProvider = DataProvider();

  static final GameRepository _instance = GameRepository._internal();

  factory GameRepository() => _instance;

  GameRepository._internal();

  Future<void> loadRepository() async {
    _financialSituations = [];
    _optionsPerGroup = {};
    _dailySituationsPerDay = {};
    _lockedDailySituations = {};
    _choicesOfDailySituation = {};
    _financialChoicesCosts = {};

    final financialSituationsSql =
        await _dataProvider.loadFinancialSituations();
    final financialChoiceCostsSql =
        await _dataProvider.loadFinancialChoicesCost();
    final choicesSql = await _dataProvider.loadChoices();
    final eventsSql = await _dataProvider.loadEvents();
    final dailySituationsSql = await _dataProvider.loadDailySituations();
    final dailySituationChoicesSql =
        await _dataProvider.loadDailySituationChoices();
    final financialDailiesSql = await _dataProvider.loadFinancialDailies();
    final definitionsSql = await _dataProvider.loadDefinitions();

    final optionsSql = await _dataProvider.loadOptions();
    final optionGroupsSql = await _dataProvider.loadOptionGroups();
    final optionDailiesSql = await _dataProvider.loadOptionsDailies();
    final additionalChargesSql = await _dataProvider.loadAdditionalCharges();

    // Get definitions
    _definitions = definitionsSql.map((d) => Definition.fromTuple(d)).toList();

    //get Events for DailySituation
    Map<int, String> events = Map.fromIterable(eventsSql,
        key: (e) => e['id'], value: (e) => e['label']);
    Map<int, String> choices = Map.fromIterable(choicesSql,
        key: (e) => e['id'], value: (e) => e['label']);

    // Get a map of the dailySituations to unlock
    // id Daily_situation -> List<id FinancialSituation
    Map<int, List<int>> dailyFinancialMap = {};

    for (var financialDailyTuple in financialDailiesSql) {
      dailyFinancialMap.putIfAbsent(
          financialDailyTuple['daily_situation'], () => []);
      dailyFinancialMap[financialDailyTuple['daily_situation']]!
          .add(financialDailyTuple['financial_situation']);
    }

    List<DailySituation> dailySituations = dailySituationsSql
        .map((e) => DailySituation.fromTuple(e, events))
        .toList();

    //get options and their group
    Map<int, OptionGroup> optionGroups = Map.fromIterable(optionGroupsSql,
        key: (e) => e['id'], value: (e) => OptionGroup.fromTuple(e));
    //optionGroups[-1] = OptionGroup(id: -1, label: 'Divers'); //Miscellaneous

    Map<int, Option> options = {};
    //organize options by optionGroup
    for (var optionTuple in optionsSql) {
      Option option = Option.fromTuple(optionTuple, optionGroups);

      //int groupId = option.optionGroup.id;

      _optionsPerGroup.putIfAbsent(option.optionGroup, () => []);
      _optionsPerGroup[option.optionGroup]!.add(option);

      options[option.id] = option;
    }

    // get the daily situations that need options
    // int dailySituation.id => List<int option.id>
    Map<int, List<int>> dailyOptionsMap = {};
    for (var optionDaily in optionDailiesSql) {
      dailyOptionsMap.putIfAbsent(optionDaily['daily_situation'], () => []);
      dailyOptionsMap[optionDaily['daily_situation']]!
          .add(optionDaily['option']);
    }

    for (var financialSituation in financialSituationsSql) {
      _financialSituations
          .add(FinancialSituation.fromTuple(financialSituation));
    }

    _financialDailySituations = {};

    for (var daily in dailySituations) {
      if (daily.day > maxDay) maxDay = daily.day;

      // if the dailySituation depends on the financial one
      if (dailyFinancialMap[daily.id] != null &&
          dailyOptionsMap[daily.id] != null) {
        if (dailyFinancialMap[daily.id] != null) {
          dailyFinancialMap[daily.id]!.forEach((f) {
            _financialDailySituations.putIfAbsent(f, () => []);
            _financialDailySituations[f]!.add(daily);
          });
        }
        if (dailyOptionsMap[daily.id] != null) {
          dailyOptionsMap[daily.id]!.forEach((f) {
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

    Map<int, Choice> dailySituationChoicesMap = {};
    for (var choice in dailySituationChoicesSql) {
      Choice choiceInstance = Choice.fromTuple(choice, choices);
      dailySituationChoicesMap[choiceInstance.id] = choiceInstance;

      _choicesOfDailySituation.putIfAbsent(choice['daily_situation'], () => []);
      _choicesOfDailySituation[choice['daily_situation']]!.add(choiceInstance);
    }

    // Choice -> financialSituation -> financialChoiceCost
    for (var cost in financialChoiceCostsSql) {
      Choice choice = dailySituationChoicesMap[cost['daily_situation_choice']]!;

      _financialChoicesCosts.putIfAbsent(choice.id, () => {});
      _financialChoicesCosts[choice.id]![cost['financial_situation']] =
          FinancialChoiceCost(
              minCost: cost['min_cost'], maxCost: cost['max_cost']);
    }

    // Get the additionnal charge of the option on daily_situation choices
    for (var addCharge in additionalChargesSql) {
      _additionalChargesOfChoice.putIfAbsent(
          addCharge['daily_situation_choice'], () => []);
      _additionalChargesOfChoice[addCharge['daily_situation_choice']]!.add(
          AdditionalCharge.fromTuple(
              addCharge, options, dailySituationChoicesMap));
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

  List<Definition> getDefinitions() => _definitions;

  Map<OptionGroup, List<Option>> getOptionsPerGroup() => _optionsPerGroup;

  Set<Choice> getChoicesOfDailySituation(
      int financialSituation, int dailysituation, List<Option> options) {
    for (var choice in _choicesOfDailySituation[dailysituation]!) {
      print(choice.label);
      if (_financialChoicesCosts[choice.id] != null) {
        if (_financialChoicesCosts[choice.id]![financialSituation] != null) {
          double charge = 0;
          // Add the additional charge
          if (_additionalChargesOfChoice[choice.id] != null) {
            for (AdditionalCharge addCharge
                in _additionalChargesOfChoice[choice.id]!) {
              if (options.contains(addCharge.option)) {
                charge += addCharge.charge;
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

  List<FinancialSituation> get financialSituations => _financialSituations;
}
