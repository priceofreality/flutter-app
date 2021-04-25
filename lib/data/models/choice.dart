import 'package:json_annotation/json_annotation.dart';

part 'choice.g.dart';

@JsonSerializable()
class Choice {
  final int id;
  final String label;
  final bool concludes;
  final List<int>? unlockDailySituation;
  double? minCost;
  double? maxCost;

  Choice(
      {required this.id,
      required this.label,
      required this.concludes,
      this.minCost,
      this.maxCost,
      this.unlockDailySituation});

  factory Choice.fromTuple(Map<String, dynamic> tuple, Map<int, String> choices,
      Map<int, List<int>> unlockDailySituations) {
    List<int> unlocks = [];
    if (unlockDailySituations[tuple['id']] != null) {
      unlocks = unlockDailySituations[tuple['id']]!;
    }
    return Choice(
        id: tuple['id'],
        label: choices[tuple['choice']]!,
        concludes: tuple['concludes'] == 1,
        unlockDailySituation: unlocks);
  }

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}
