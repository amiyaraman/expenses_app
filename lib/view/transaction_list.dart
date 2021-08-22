import 'dart:ffi';

import 'package:expenses_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'eachrowview.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: !transaction.isEmpty
          ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: EachRowView(
                      transaction[index].amount.toString(),
                      transaction[index].title,
                      transaction[index].id,
                      transaction[index].date),
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
