import 'package:projet4/data/db/database.dart';

class DataProvider {
  static final DataProvider _instance = DataProvider._internal();

  factory DataProvider() => _instance;

  DataProvider._internal();

  static SqfliteDb sqlfliteDb = SqfliteDb();

  Future<List<Map<String, dynamic>>> loadFinancialSituations() async {
    List<Map<String, dynamic>> query =
        await sqlfliteDb.db.query('financial_situations');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadDailySituations() async {
    List<Map<String, dynamic>> query =
        await sqlfliteDb.db.query('daily_situations');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadFinancialChoicesCost() async {
    List<Map<String, dynamic>> query =
        await sqlfliteDb.db.query('financial_choice_costs');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadDailySituationChoices() async {
    List<Map<String, dynamic>> query =
        await sqlfliteDb.db.query('daily_situation_choices');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadAdditionalCharges() async {
    List<Map<String, dynamic>> query =
        await sqlfliteDb.db.query('additional_charges');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadChoices() async {
    List<Map<String, dynamic>> query = await sqlfliteDb.db.query('choices');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadEvents() async {
    List<Map<String, dynamic>> query = await sqlfliteDb.db.query('events');
    return query;
  }

  Future<List<Map<String, dynamic>>> loadOptions() async {
    List<Map<String, dynamic>> query = await sqlfliteDb.db.query('options');
    return query;
  }
}
