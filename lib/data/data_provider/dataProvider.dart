import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  static Future<Map<String, dynamic>> getSituations() async {
    return _parseJsonFromAssets('lib/data/db/situation.json');
  }

  static Future<Map<String, dynamic>> getSuggestions() async {
    return _parseJsonFromAssets('lib/data/db/suggestion.json');
  }

  static Future<Map<String, dynamic>> getChoices() async {
    return _parseJsonFromAssets('lib/data/db/choice.json');
  }

  static Future<Map<String, dynamic>> getActions() async {
    return _parseJsonFromAssets('lib/data/db/action.json');
  }

  static Future<Map<String, dynamic>> _parseJsonFromAssets(String assetsPath) =>
      rootBundle.loadString(assetsPath).then((jsonStr) => jsonDecode(jsonStr));
}
