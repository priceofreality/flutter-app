import 'dart:io';

import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class SqfliteDb {
  static final SqfliteDb _instance = SqfliteDb.internal();

  factory SqfliteDb() => _instance;

  SqfliteDb.internal();

  late Database db;

  Future<void> openDb() async {
    /*
    String dbpath = 'lib/data/db/database.sqlite';
    String path = join(dbpath, 'database.db');

    try {
      await Directory(dbpath).create(recursive: true);
    } catch (_) {}
  */
    //DEBUG
    //await databaseFactory.deleteDatabase(path);

    //ByteData data = await rootBundle.load('lib/data/db/database.sqlite');
    db = await openDatabase('lib/data/db/db.db', version: 1);
  }

  Future<void> closeDb() async => await db.close();
}
