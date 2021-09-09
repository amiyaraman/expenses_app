import 'dart:ffi';

import 'package:expenses_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'eachrowview.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletets;

  TransactionList(this.transaction, this.deletets);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: !transaction.isEmpty
          ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('Rs ${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transaction[index].date)),
                    trailing: IconButton(
                      onPressed: () {
                        deletets(transaction[index].id);
                      },
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            )
          : Column(
              children: [
                Text("No Transection",
                    style: Theme.of(context).textTheme.title),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assert/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            ),
    );
  }
}
