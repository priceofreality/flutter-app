import 'package:projet4/data/db/database.dart';
import 'package:projet4/data/repositories/game.dart';

class DataInit {
  static Future<void> loadGameAssets() async {
    await SqfliteDb().openDb();
    await GameRepository().loadRepository();
    //await SqfliteDb().closeDb();
  }

  static Future<void> reloadGameAssets() async {
    await GameRepository().loadRepository();
  }
}
