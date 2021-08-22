import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  var afunctioncall;
  NewTransaction(this.afunctioncall);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final AmountInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: AmountInput,
              keyboardType: TextInputType.number,
              // onChanged: (value){
              //   AmountInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleInput,
              onSubmitted: (_) {
                widget.afunctioncall(
                    amount: double.parse(AmountInput.text),
                    title: titleInput.text);
                Navigator.of(context).pop();
              },
              // onChanged: (value){
              //   titleInput = value;
              // },
            ),
            ElevatedButton(
                onPressed: () {
                  widget.afunctioncall(
                      amount: double.parse(AmountInput.text),
                      title: titleInput.text);
                  Navigator.of(context).pop();
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
