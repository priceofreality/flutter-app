import 'dart:io';

import "package:path/path.dart";
import 'package:projet4/data/db/requests.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDb {
  static final SqfliteDb _instance = SqfliteDb.internal();

  factory SqfliteDb() => _instance;

  SqfliteDb.internal();

  late Database db;

  Future<void> openDb() async {
    String dbpath = await getDatabasesPath();
    String path = join(dbpath, 'database.db');
    Requests requests = Requests();

    try {
      await Directory(dbpath).create(recursive: true);
    } catch (_) {}

    db = await openDatabase(path, version: 1);

    await db.execute(requests.createFinancialSituations);
    await db.execute(requests.createChoices);
    await db.execute(requests.createEvents);
    //await db.execute(requests.createOptions);
    await db.execute(requests.createDailySituations);
    await db.execute(requests.createDailySituationsChoices);
    await db.execute(requests.createFinancialChoiceCosts);
    //await db.execute(requests.createAdditionalCharges);

    await db.rawInsert(requests.insertFinancialSituations);
    await db.rawInsert(requests.insertChoices);
    await db.rawInsert(requests.insertEvents);
    //await db.rawInsert(requests.insertOptions);
    await db.rawInsert(requests.insertDailySituations);
    await db.rawInsert(requests.insertDailySituationChoices);
    await db.rawInsert(requests.insertFinancialChoiceCost);
    //await db.rawInsert(requests.insertAdditionalCharges);
  }

  Future<void> closeDb() async => await db.close();
}
