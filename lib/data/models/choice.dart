import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String label;
  final bool concludes;
  List<int>? unlockDailySituation;
  double? minCost;
  double? maxCost;

  Choice(
      {required this.id,
      required this.label,
      required this.concludes,
      this.minCost,
      this.maxCost,
      this.unlockDailySituation});

  factory Choice.fromTuple(
      Map<String, dynamic> tuple, Map<int, String> choices) {
    List<int> unlocks = [];
    if (tuple['unlock_daily_situation'] != null) {
      unlocks.add(tuple['unlock_daily_situation']);
    }
    return Choice(
        id: tuple['id'],
        label: choices[tuple['choice']]!,
        concludes: tuple['concludes'] == 1,
        unlockDailySituation: unlocks);
  }

  void addUnlock(int dailySituation) {
    if (unlockDailySituation == null) unlockDailySituation = [];
    this.unlockDailySituation!.add(dailySituation);
  }

  @override
  List<Object> get props => [id];
}
