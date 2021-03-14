import 'package:equatable/equatable.dart';
import 'package:projet4/data/models/transaction.dart';

class Summary extends Equatable {
  final double initialbudget;
  final List<Transaction> transactions;

  Summary({required this.initialbudget, required this.transactions});

  @override
  List<Object?> get props => [initialbudget, transactions];
}
