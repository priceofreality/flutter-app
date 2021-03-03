import 'package:projet4/data/data_provider/dataProvider.dart';
import 'package:projet4/data/models/ActionChoice.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/models/suggestion.dart';

class ActionRepository {
  // Map day / list of the actions of the day
  Map<int, List<ActionChoice>> actions;

  ActionRepository() {
    this.actions = new Map();
    _init();
  }

  void _init() async {
    Future<Map<String, dynamic>> suggestionsMap = DataProvider.getSuggestions();
    Future<Map<String, dynamic>> choicesMap = DataProvider.getChoices();
    Future<Map<String, dynamic>> actionsMap = DataProvider.getActions();

    Map<int, Suggestion> suggestions = new Map();
    Map<int, Choice> choices = new Map();
    await suggestionsMap.then((value) => _putToSuggestions(value, suggestions));
    await choicesMap.then((value) => _putToChoices(value, choices));
    actionsMap
        .then((value) => _putToActions(value, suggestions, choices, actions));
  }

  List<ActionChoice> getActions(int day) {
    return this.actions[day];
  }

  void _putToSuggestions(
      Map<String, dynamic> value, Map<int, Suggestion> suggestions) {
    for (String key in value.keys) {
      String entitled = value[key];
      int id = int.tryParse(key);
      Suggestion suggestion = Suggestion(id: key, entitled: entitled);
      suggestions[id] = suggestion;
    }
  }

  void _putToChoices(Map<String, dynamic> value, Map<int, Choice> choices) {
    for (String key in value.keys) {
      Map<String, dynamic> choiceMap = value[key];
      int id = int.tryParse(key);
      String choiceString = choiceMap["Choice"];
      double budget = choiceMap["Budget"];
      Choice choice = Choice(id: key, choice: choiceString, budget: budget);
      choices[id] = choice;
    }
  }

  void _putToActions(
      Map<String, dynamic> value,
      Map<int, Suggestion> suggestions,
      Map<int, Choice> choices,
      Map<int, List<ActionChoice>> actionChoices) {
    for (String key in value.keys) {
      Map<String, dynamic> actionChoiceMap = value[key];
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
