import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String label;
  final bool concludes;
  final int unlock;
  double minCost;
  double? maxCost;

  Choice(
      {required this.id,
      required this.label,
      required this.concludes,
      required this.minCost,
      this.maxCost,
      required this.unlock});

  factory Choice.fromTuple(
          Map<String, dynamic> tuple, Map<int, String> choices) =>
      Choice(
          id: tuple['id'],
          label: choices[tuple['choice']]!,
          concludes: tuple['concludes'],
          minCost: tuple['initial_min_cost'],
          maxCost: tuple['initial_max_cost'],
          unlock: tuple['unlock']);

  @override
  List<Object> get props => [id];
}
