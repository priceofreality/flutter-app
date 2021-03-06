import 'dart:io';

import 'package:flutter/foundation.dart';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

class SqfliteDb {
  static final SqfliteDb _instance = SqfliteDb.internal();

  factory SqfliteDb() => _instance;

  SqfliteDb.internal();

  late Database db;

  Future<void> openDb() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "price_of_reality.db");

    if (kDebugMode) {
      print("Delete DB");
      await databaseFactory.deleteDatabase(path);
    }

    var exists = await databaseExists(path);

    if (!exists) {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load('assets/database/database.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    db = await openDatabase(path, version: 1);
  }

  Future<void> closeDb() async => await db.close();
}
