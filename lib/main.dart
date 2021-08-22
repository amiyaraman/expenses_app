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
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
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
  void _addNewTranscation({required String title, required double amount}) {
    final newTrasaction = Transaction(
        amount: amount, title: title, date: DateTime.now(), id: "ID123");
    setState(() {
      transaction.add(newTrasaction);
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
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Card(
                child: Container(
                  width: double.infinity,
                  child: Text("Hello There"),
                ),
                elevation: 5,
              ),
            ),
            TransactionList(transaction),
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
