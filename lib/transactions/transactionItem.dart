import 'package:accounts2/actions/getTransactions.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final Transaction t;
  const TransactionItem({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(t.remarks),
    );
  }
}
