part of 'transaction_cubit.dart';

class TransactionState extends Equatable {
  final double budget;
  final double currentCost;

  final List<Transaction> transactions;

  const TransactionState(
      {required this.budget,
      required this.currentCost,
      required this.transactions});

  @override
  List<Object> get props => [budget, currentCost];
}

class TransactionInitialState extends TransactionState {
  TransactionInitialState(double budget)
      : super(currentCost: 0, transactions: [], budget: budget);
}
