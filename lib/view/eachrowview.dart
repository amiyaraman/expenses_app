import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EachRowView extends StatelessWidget {
  String amoutn;
  String title;
  String id;
  DateTime date;
  EachRowView(this.amoutn, this.title, this.id, this.date);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              border: Border.all(
            color: Theme.of(context).primaryColorDark,
            width: 2,
          )),
          padding: EdgeInsets.all(10),
          child: Text(
            amoutn.toString() + " Rs",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.purple,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              id.toString(),
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              DateFormat.yMMMMd().format(date),
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }
}
