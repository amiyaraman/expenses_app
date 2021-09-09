import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  var afunctioncall;
  NewTransaction(this.afunctioncall);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInput = TextEditingController();

  final AmountInput = TextEditingController();

  DateTime? _selecteddate = null;
  void _presentDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickeddate) {
      if (pickeddate == null) {
        return;
      }
      setState(() {
        _selecteddate = pickeddate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
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
              Container(
                height: 70,
                child: Row(
                  children: [
                    // ignore: unnecessary_null_comparison
                    Expanded(
                      child: Text(_selecteddate == null
                          ? "No Date Is picked"
                          : (DateFormat.yMd()
                              .format(_selecteddate!)
                              .toString())),
                    ),
                    ElevatedButton(
                      onPressed: _presentDatepicker,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Text(
                        "Pick a date",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (AmountInput.text.isEmpty ||
                        titleInput.text.isEmpty ||
                        _selecteddate == null) {
                      print('do nothing');
                    } else {
                      widget.afunctioncall(
                          amount: double.parse(AmountInput.text),
                          title: titleInput.text,
                          datetime: _selecteddate);

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
