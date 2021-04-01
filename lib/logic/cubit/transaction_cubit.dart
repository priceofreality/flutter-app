import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/choice.dart';
import 'package:price_of_reality/data/models/daily_situation.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/transaction.dart';
import 'package:price_of_reality/logic/cubit/financial_situation_cubit.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  //final FinancialSituationCubit financialSituationCubit;

  TransactionCubit() : super(TransactionInitialState(0));

  emitBudget(double budget) {
    emit(TransactionInitialState(budget));
  }

  emitCost(double cost) => emit(TransactionState(
        currentCost: cost,
        transactions: state.transactions,
        budget: state.budget,
      ));

  void emitTransaction(DailySituation dailySituation, Choice choice) {
    double budget = state.budget;
    List<Transaction> transactions = state.transactions;
    double currentCost = state.currentCost;

    budget += currentCost;
    transactions.add(Transaction(
        day: dailySituation.day,
        event: dailySituation.event,
        choice: choice.label,
        cost: currentCost));

    emit(TransactionState(
        budget: budget, currentCost: currentCost, transactions: transactions));
  }
}
