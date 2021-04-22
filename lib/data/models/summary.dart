import 'package:equatable/equatable.dart';
import 'package:price_of_reality/data/models/financial_situation.dart';
import 'package:price_of_reality/data/models/transaction.dart';

class Summary extends Equatable {
  final FinancialSituation financialSituation;
  final List<Transaction> transactions;

  Summary({required this.financialSituation, required this.transactions});

  @override
  List<Object?> get props => [financialSituation, transactions];
}
