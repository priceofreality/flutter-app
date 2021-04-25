import 'package:json_annotation/json_annotation.dart';
import 'package:price_of_reality/data/models/transaction.dart';

part 'transaction_state.g.dart';

@JsonSerializable(explicitToJson: true)
class TransactionState {
  final double budget;
  final double currentCost;

  final TransactionRewindState? lastTransactionState;

  final List<Transaction> transactions;

  const TransactionState(this.budget, this.currentCost, this.transactions,
      this.lastTransactionState);

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionStateToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TransactionRewindState {
  final double budget;
  final double currentCost;

  final List<Transaction> transactions;

  const TransactionRewindState(
    this.budget,
    this.currentCost,
    this.transactions,
  );

  factory TransactionRewindState.fromJson(Map<String, dynamic> json) =>
      _$TransactionRewindStateFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionRewindStateToJson(this);
}
