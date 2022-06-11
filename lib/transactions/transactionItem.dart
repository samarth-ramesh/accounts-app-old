import 'package:accounts2/actions/getTransactions.dart';
import 'package:flutter/material.dart';

String dtToDDMMYY(DateTime dt) {
  return "${dt.day}/${dt.month}/${dt.year}";
}

String dtToHHMM(DateTime dt) {
  return "${dt.hour}:${dt.minute}";
}

class TransactionItem extends StatelessWidget {
  final Transaction t;

  const TransactionItem({Key? key, required this.t}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(dtToDDMMYY(t.dateTime.toUtc())),
                  Text(dtToHHMM(t.dateTime.toUtc()))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Remarks: ",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    t.remarks,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [const Text("From"), Text(t.acc1)],
                  ),
                  Column(
                    children: [const Text("Amount"), Text(t.amt.toString())],
                  ),
                  Column(
                    children: [
                      const Text("To"),
                      Text(t.acc2),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }
}
