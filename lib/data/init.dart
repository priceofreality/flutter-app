import 'package:price_of_reality/data/db/database.dart';
import 'package:price_of_reality/data/repositories/game.dart';

class DataInit {
  static Future<void> loadGameAssets() async {
    print("Load Game assets");
    await SqfliteDb().openDb();
    await GameRepository().loadRepository();
    //await SqfliteDb().closeDb();
  }

  static Future<void> reloadGameAssets() async {
    await GameRepository().loadRepository();
  }
}
