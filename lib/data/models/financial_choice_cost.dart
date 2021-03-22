import 'package:equatable/equatable.dart';

class FinancialChoiceCost extends Equatable {
  final double minCost;
  final double? maxCost;

  const FinancialChoiceCost({required this.minCost, this.maxCost});

  @override
  List<Object?> get props => [];
}
