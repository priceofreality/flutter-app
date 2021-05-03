import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:price_of_reality/data/models/summary.dart';
import 'package:price_of_reality/data/models/transaction.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:price_of_reality/data/models/situations_options.dart';

class SummaryPage extends StatefulWidget {
  final Summary summary;

  SummaryPage({required this.summary});
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  final days = [
    'Vendredi',
    'Samedi',
    'Dimanche',
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi'
  ];

  Future<List<Widget>> sortTransactions(BuildContext context) {
    return Future(() {
      Map<int, List<Transaction>> transactions =
          groupBy(widget.summary.transactions, (Transaction t) => t.day);

      List<Widget> children = [];
      double budget = widget.summary.financialSituation.initialBudget;

      final situation = Column(
        children: [
          Text(
            "${AppLocalizations.of(context)!.situation} : ",
            style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.0),
          Text(
            "${widget.summary.financialSituation.familySituation.label}",
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).buttonColor),
          ),
          Text(
            "${widget.summary.financialSituation.professionalSituation.label}",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.5,
                color: Theme.of(context).buttonColor),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );

      children.add(situation);

      final divider = Divider(
        color: Color(0xffe08963),
        thickness: 1.5,
        indent: 14.0,
        endIndent: 14.0,
      );

      for (MapEntry<int, List<Transaction>> entry in transactions.entries) {
        final day = Container(
          padding: EdgeInsets.only(left: 14.0, top: 13.0, bottom: 7.0),
          child: Text(
            '${days[(entry.key - 1) % 7]} ${entry.key >= 31 ? ((entry.key + 1) % 31) : (entry.key % 31)}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        );

        List<ListTile> transactions = [];
        for (Transaction t in entry.value) {
          budget += t.cost;
          transactions.add(ListTile(
            title: Text('${t.event}'),
            subtitle: Align(
              child: Text('${t.choice}: ${t.cost}€'),
              alignment: Alignment.bottomRight,
            ),
          ));
        }

        final sum = Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${budget.toStringAsFixed(2)}€',
            style: TextStyle(
                color: budget >= 0 ? Colors.black : Colors.red[600],
                fontWeight: FontWeight.w500),
          ),
        );

        children.add(day);
        children.addAll(transactions);
        children.add(divider);
        children.add(sum);
      }

      return children;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.summary),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: sortTransactions(context),
          builder: (context, AsyncSnapshot<List<Widget>?> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => snapshot.data![index],
                    padding: EdgeInsets.only(top: 18.0, bottom: 50.0),
                  )
                : Center(child: Text(AppLocalizations.of(context)!.loading));
          },
        ),
      ),
    );
  }
}
