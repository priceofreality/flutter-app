import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class DataProvider {
  static Future<Map<String, dynamic>> getSituations() async {
    return parseJsonFromAssets('lib/data/db/situation.json');
  }

  static Future<Map<String, dynamic>> getSuggestions() async {
    return parseJsonFromAssets('lib/data/db/suggestion.json');
  }

  static Future<Map<String, dynamic>> getChoices() async {
    return parseJsonFromAssets('lib/data/db/choice.json');
  }

  static Future<Map<String, dynamic>> getActions() async {
    return parseJsonFromAssets('lib/data/db/action.json');
  }

  static Future<Map<String, dynamic>> parseJsonFromAssets(
      String assetsPath) async {
    print('--- Parse json from: $assetsPath');
    Future<Map<String, dynamic>> map = rootBundle
        .loadString(assetsPath)
        .then((jsonStr) => jsonDecode(jsonStr));
    print('Map = $map');
    return map;
  }
}
