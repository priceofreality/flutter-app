import 'package:flutter/services.dart' show rootBundle;
import '../db/database.dart' show SqliteDB;
import 'package:sqflite/sqflite.dart';


class DataProvider {
  static final DataProvider _instance = DataProvider._internal();

  factory DataProvider() => _instance;

  DataProvider._internal();

  Future<List<Map<String, dynamic>>> loadFinancialSituations() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('financial_situations');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadChoices() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('choices');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadEvents() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('events');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadFinancialChoiceCosts() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('financial_choice_costs');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadDailySituations() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('daily_situations');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadDailySituationChoices() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('daily_situation_choices');
      return maps;
  }
   Future<List<Map<String, dynamic>>> loadChoiceDailySituations() async {
      Database dbClient = await SqliteDB().db;
      Future<List<Map<String, dynamic>>> maps = dbClient.query('choice_daily_situations');
      return maps;
  }
}
