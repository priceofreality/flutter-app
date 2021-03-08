import 'package:equatable/equatable.dart';

class FinancialSituation extends Equatable {
  final int id;
  final String label;
  double budget;

  FinancialSituation(
      {required this.id, required this.label, required this.budget});

  factory FinancialSituation.fromJson(Map<String, dynamic> json) =>
      FinancialSituation(
          id: json['id'], label: json['label'], budget: json['budget']);

  @override
  String toString() {
    return "${this.id} : ${this.label} ${this.budget}";
  }

  @override
  List<Object> get props => [id];
}
