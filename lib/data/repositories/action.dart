import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:projet4/data/data_provider/dataProvider.dart';
import 'package:projet4/data/models/ActionChoice.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/models/suggestion.dart';

class ActionRepository {
  Map<int, List<ActionChoice>> actions;

  ActionRepository() {
    this.actions = new Map();
    init();
  }

  void init() {
    Future<Map<String, dynamic>> suggestionsMap = DataProvider.getSuggestions();
    Future<Map<String, dynamic>> choicesMap = DataProvider.getChoices();
    Future<Map<String, dynamic>> actionsMap = DataProvider.getActions();

    Map<int, Suggestion> suggestions = new Map();
    Map<int, Choice> choices = new Map();
    suggestionsMap.then((value) => putToSuggestions(value, suggestions));
    actionsMap.then((value) => null);
  }

  void putToSuggestions(
      Map<String, dynamic> value, Map<int, Suggestion> suggestions) {
    for (String key in value.keys) {
      String entitled = value[key];
      int id = int.tryParse(key);
      Suggestion suggestion = Suggestion(id: key, entitled: entitled);
      suggestions[id] = suggestion;
    }
  }

  void putToChoices(Map<String, dynamic> value, Map<int, Choice> choices) {
    for (String key in value.keys) {
      Map<String, dynamic> choiceMap = value[key];
      int id = int.tryParse(key);
      String choiceString = choiceMap["Choice"];
      double budget = choiceMap["Budget"];
      Choice choice = Choice(id: key, choice: choiceString, budget: budget);
      choices[id] = choice;
    }
  }

  void putToActions(
      Map<String, dynamic> value,
      Map<int, Suggestion> suggestions,
      Map<int, Choice> choices,
      Map<int, List<ActionChoice>> actionChoices) {
    for (String key in value.keys) {
      Map<String, dynamic> actionChoiceMap = value[key];
      List<int> choicesIds;
      List<Choice> choices = [];
      for (int choiceId in actionChoiceMap["Choices"]) {
        choices.add(choices[choiceId]);
      }

      int day = actionChoiceMap["Day"];
      int suggestionId = actionChoiceMap["Suggestion"];
      Suggestion suggestion = suggestions[suggestionId];
      ActionChoice actionChoice = ActionChoice(
          choices: choices, day: day, id: key, suggestion: suggestion);
      actionChoices.putIfAbsent(day, () => []);
      actionChoices[day].add(actionChoice);
    }
  }
}
