import 'package:flutter/material.dart';
import "package:collection/collection.dart";
import 'package:projet4/data/models/summary.dart';
import 'package:projet4/data/models/transaction.dart';

class SummaryPage extends StatefulWidget {
  Summary summary;

  SummaryPage({required this.summary});
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Future<List<Widget>> sortTransactions() {
    return Future(() {
      Map<int, List<Transaction>> transactions =
          groupBy(widget.summary.transactions, (Transaction t) => t.day);

      List<Widget> children = [];
      double budget = widget.summary.initialbudget;

      final initial = Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 20.0),
        child: Text(
          'Starting budget: $budget€',
          style: TextStyle(
            fontSize: 17.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

      children.add(initial);

      for (MapEntry<int, List<Transaction>> entry in transactions.entries) {
        final day = Container(
          padding: EdgeInsets.only(left: 14.0, top: 13.0, bottom: 7.0),
          child: Text(
            'Jour ${entry.key}',
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

        final divider = Divider(
          color: Color(0xffe08963),
          thickness: 1.5,
          indent: 14.0,
          endIndent: 14.0,
        );

        final sum = Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '$budget€',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
        title: Text('Resume'),
        backgroundColor: Theme.of(context).accentColor,
        centerTitle: true,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: sortTransactions(),
          builder: (context, AsyncSnapshot<List<Widget>?> snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => snapshot.data![index],
                    padding: EdgeInsets.only(top: 18.0, bottom: 50.0),
                  )
                : Center(child: Text('Loading'));
          },
        ),
      ),
    );
  }
}
