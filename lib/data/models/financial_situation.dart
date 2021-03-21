import 'package:equatable/equatable.dart';

class FinancialSituation extends Equatable {
  final int id;
  final String label;

  const FinancialSituation({required this.id, required this.label});

  factory FinancialSituation.fromTuple(Map<String, dynamic> tuple) =>
      FinancialSituation(id: tuple['id'], label: tuple['label']);

  @override
  List<Object> get props => [id];
}
