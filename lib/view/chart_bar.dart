import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Container(
        child: Column(
          children: [
            Container(
                height: constrain.maxHeight * .15,
                child: FittedBox(
                    child: Text("${spendingAmount.toStringAsFixed(0)}Rs"))),
            SizedBox(
              height: constrain.maxHeight * .05,
            ),
            Container(
              height: constrain.maxHeight * .6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromARGB(220, 220, 221, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constrain.maxHeight * .05,
            ),
            Container(
                height: constrain.maxHeight * .15,
                child: FittedBox(child: Text(label))),
          ],
        ),
      );
    });
  }
}
