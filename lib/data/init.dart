import 'package:projet4/data/repositories/game.dart';

class DataInit {
  static Future<void> loadGameAssets() async {
    await GameRepository().loadRepository();
  }
}
