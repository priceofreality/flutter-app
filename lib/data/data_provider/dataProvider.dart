import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  static Future<List<dynamic>> getSituations() async {
    return _parseJsonListFromAssets('lib/data/db/situation.json');
  }

  static Future<List<dynamic>> getSuggestions() async {
    return _parseJsonListFromAssets('lib/data/db/suggestion.json');
  }

  static Future<List<dynamic>> getChoices() async {
    return _parseJsonListFromAssets('lib/data/db/choice.json');
  }

  static Future<List<dynamic>> getActions() async {
    return _parseJsonListFromAssets('lib/data/db/action.json');
  }

  static Future<Map<String, dynamic>> _parseJsonMapFromAssets(
      String assetsPath) async {
    return await jsonDecode(await rootBundle.loadString(assetsPath));
  }

  static Future<List<dynamic>> _parseJsonListFromAssets(
      String assetsPath) async {
    return await jsonDecode(await rootBundle.loadString(assetsPath));
  }
}
