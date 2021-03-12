import 'package:bloc/bloc.dart';
import 'package:projet4/data/models/financial_situation.dart';
import 'package:projet4/data/repositories/game.dart';

part 'financial_situation_state.dart';

class FinancialSituationCubit extends Cubit<FinancialSituationState> {
  static final GameRepository gameRepository = GameRepository();

  FinancialSituationCubit() : super(FinancianSituationInitialState());

  void emitFinancialSituation(FinancialSituation financialSituation) =>
      emit(FinancialSituationState(financialSituation, []));

  void emitTransaction(double cost) {
    FinancialSituation situation = state.financialSituation!;
    List<String> transactions = state.transactions;

    situation.budget += cost;
    transactions.add('test $cost');

    emit(FinancialSituationState(situation, transactions));
  }
}
