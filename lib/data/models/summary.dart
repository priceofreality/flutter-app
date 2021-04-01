import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/transaction.dart';

class Summary extends Equatable {
  final double initialBudget;
  final List<Transaction> transactions;

  Summary({required this.initialBudget, required this.transactions});

  @override
  List<Object?> get props => [initialBudget, transactions];
}
