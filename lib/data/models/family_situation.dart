import 'package:equatable/equatable.dart';

class FamilySituation extends Equatable {
  final int id;
  final String label;
  final double initialBudget;

  const FamilySituation(
      {required this.id, required this.label, required this.initialBudget});

  factory FamilySituation.fromTuple(Map<String, dynamic> tuple) =>
      FamilySituation(
          id: tuple['id'],
          label: tuple['label'],
          initialBudget: tuple['initial_budget']);

  @override
  List<Object?> get props => [id];
}
