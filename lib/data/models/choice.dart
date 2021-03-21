import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final int id;
  final String label;
  final bool concludes;
  double minCost;
  final double maxCost;
  final int unlock;

  Choice(
      {required this.id,
      required this.label,
      required this.concludes,
      required this.minCost,
      required this.maxCost,
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
