import 'package:projet4/data/data_provider/dataProvider.dart';
import 'package:projet4/data/models/action_choice.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/models/suggestion.dart';
import 'dart:developer';

class ActionRepository {
  // Map day / list of the actions of the day
  Map<int, List<ActionChoice>> actions;

  static final ActionRepository _actionRepository =
      ActionRepository._internal();

  factory ActionRepository() {
    return _actionRepository;
  }
  ActionRepository._internal() {
    actions = new Map();
    _init();
  }

  void _init() async {
    List<dynamic> suggestionsList = await DataProvider.getSuggestions();
    List<dynamic> choicesList = await DataProvider.getChoices();
    List<dynamic> actionsList = await DataProvider.getActions();

    List<Suggestion> suggestions = suggestionsList
        .asMap()
        .map((index, value) {
          return MapEntry(index, Suggestion(id: index, entitled: value));
        })
        .values
        .toList();

    List<Choice> choices = choicesList
        .asMap()
        .map((index, value) {
          return MapEntry(
              index,
              Choice(
                  id: index, choice: value["Choice"], budget: value["Budget"]));
        })
        .values
        .toList();
    /*_putToSuggestions(suggestionsMap, suggestions);
    _putToChoices(choicesMap, choices);*/
    _putToActions(actionsList, suggestions, choices, actions);
  }

  List<ActionChoice> getActions(int day) {
    return actions[day];
  }

  /*void _putToSuggestions(
      Map<String, dynamic> value, Map<int, Suggestion> suggestions) {
    for (String key in value.keys) {
      String entitled = value[key];
      int id = int.tryParse(key);
      Suggestion suggestion = Suggestion(id: id, entitled: entitled);
      suggestions[id] = suggestion;
    }
  }

  void _putToChoices(Map<String, dynamic> value, Map<int, Choice> choices) {
    for (String key in value.keys) {
      Map<String, dynamic> choiceMap = value[key];
      int id = int.tryParse(key);
      String choiceString = choiceMap["Choice"];
      double budget = choiceMap["Budget"];
      Choice choice = Choice(id: id, choice: choiceString, budget: budget);
      choices[id] = choice;
    }
  }*/

  void _putToActions(List<dynamic> value, List<Suggestion> suggestions,
      List<Choice> choices, Map<int, List<ActionChoice>> actionChoices) {
    for (dynamic key in value) {
      int day = key["Day"];
      int suggestionId = key["Suggestion"];
      Suggestion suggestion = suggestions[suggestionId];
      List<Choice> actionsChoices = List();
      for (int val in key["Choices"]) {
        actionsChoices.add(choices[val]);
      }
      ActionChoice actionChoice = ActionChoice(
          choices: actionsChoices,
          day: day,
          id: "${day}",
          suggestion: suggestion);
      actionChoices.putIfAbsent(day, () => []);
      actionChoices[day].add(actionChoice);
    }
  }
}
