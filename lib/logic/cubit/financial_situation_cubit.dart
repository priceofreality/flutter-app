import 'package:bloc/bloc.dart';
import 'package:projet4/data/models/choice.dart';
import 'package:projet4/data/models/daily_situation.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/models/transaction.dart';
import 'package:projet4/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit() : super(FinancianSituationInitialState());

  void emitFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(financialSituation, []));

  void emitTransaction(
      double cost, DailySituation dailySituation, Choice choice) {
    FinancialSituation situation = state.financialSituation!;
    List<Transaction> transactions = state.transactions;

    situation.budget += cost;
    transactions.add(Transaction(
        day: dailySituation.day,
        event: dailySituation.event,
        choice: choice.label,
        cost: cost));

    emit(FinancialSituationState(situation, transactions));
  }
}
