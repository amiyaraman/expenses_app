import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Transaction({
    required this.amount,
    required this.title,
    required this.date,
    required this.id,
  });
}
