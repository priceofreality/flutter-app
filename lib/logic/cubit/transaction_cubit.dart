import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/transaction.dart';
import 'package:price_of_reality/logic/cubit/transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState(0, 0, [], null));

  void emitBudget(double budget) => emit(
      TransactionState(budget, state.currentCost, state.transactions, null));

  void emitCost(double cost) => emit(TransactionState(
      state.budget, cost, state.transactions, state.lastTransactionState));

  void emitTransaction(DailySituation dailySituation, Choice choice) {
    double budget = state.budget;
    List<Transaction> transactions = state.transactions;
    double currentCost = state.currentCost;

    final last = TransactionRewindState(budget, currentCost);

    budget += currentCost;
    transactions.add(Transaction(
        day: dailySituation.day,
        event: dailySituation.event,
        choice: choice.label,
        cost: currentCost));

    emit(TransactionState(budget, currentCost, transactions, last));
  }

  void emitReset() => emit(TransactionState(0, 0, [], null));

  void emitRewind() {
    var transactions = state.transactions;
    transactions.removeAt(transactions.length - 1);

    emit(TransactionState(state.lastTransactionState!.budget,
        state.lastTransactionState!.currentCost, transactions, null));
  }

  @override
  TransactionState? fromJson(Map<String, dynamic> json) =>
      TransactionState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(TransactionState state) => state.toJson();
}
