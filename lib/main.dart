import 'package:expenses_app/view/charview.dart';
import 'package:expenses_app/view/new_transaction.dart';

import 'package:flutter/material.dart';

import 'model/transaction.dart';
import 'view/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.redAccent,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
        ),
      ),
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  final List<Transaction> transaction = [];

  List<Transaction>? get _recentTransactions {
    return transaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTranscation(
      {required String title,
      required double amount,
      required DateTime datetime}) {
    final newTrasaction = Transaction(
        amount: amount,
        title: title,
        date: datetime,
        id: DateTime.now().toString());
    setState(() {
      transaction.add(newTrasaction);
    });
  }

  void _deleteTranscation(String id) {
    setState(() {
      transaction.removeWhere((item) {
        return item.id == id;
      });
    });
  }

  void startaddnewtransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (btxbuilder) {
          return NewTransaction(_addNewTranscation);
        });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        "Expenses App",
        style: TextStyle(fontFamily: 'OpenSans'),
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () {
              startaddnewtransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions!)),
            Container(
                height: (MediaQuery.of(context).size.height -
                        appbar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(transaction, _deleteTranscation)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startaddnewtransaction(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
