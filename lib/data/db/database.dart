import "dart:io" as io;
import 'dart:io';
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqliteDB {
  static final SqliteDB _instance = new SqliteDB.internal();

  factory SqliteDB() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    // fill db with table
    await fillDb();
    return _db!;
  }

  SqliteDB.internal();

  Future<Database> initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "galette.db");
    var taskDb = await openDatabase(path, version: 1);
    return taskDb;
  }

  Future<void> fillDb() async {
    var dbClient = await SqliteDB().db;
    String requests = await readRequests();
    await dbClient.execute(requests);
  }

  Future<String> readRequests() async {
    String fileContent = "";
    try {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      File fd = File('$path/lib/data/db/requests.txt');
      fileContent = await fd.readAsString();
    } catch (e) {
      print("error read file db");
    }
    return fileContent;
  }
}
