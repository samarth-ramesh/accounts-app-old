import 'package:flutter/material.dart';

import '../actions/get_transactions.dart';

class EditTransaction extends StatefulWidget {
  final Transaction transaction;
  const EditTransaction({Key? key, required this.transaction}) : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
