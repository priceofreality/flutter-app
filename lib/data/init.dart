import 'package:projet4/data/repositories/game.dart';

class DataInit {
  static GameRepository _gameRepository = GameRepository();

  static Future<void> loadGameAssets() async {
    await _gameRepository.loadRepository();
  }
}
