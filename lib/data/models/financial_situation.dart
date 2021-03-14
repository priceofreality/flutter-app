import 'package:equatable/equatable.dart';

class FinancialSituation extends Equatable {
  final int id;
  final String label;
  double budget;

  FinancialSituation(
      {required this.id, required this.label, required this.budget});

  factory FinancialSituation.fromTuple(Map<String, dynamic> tuple) =>
      FinancialSituation(
          id: tuple['id'], label: tuple['label'], budget: tuple['budget']);

  FinancialSituation.clone({required FinancialSituation financialSituation})
      : this(
            id: financialSituation.id,
            label: financialSituation.label,
            budget: financialSituation.budget);

  @override
  String toString() {
    return "${this.id} : ${this.label} ${this.budget}";
  }

  @override
  List<Object> get props => [id];
}
