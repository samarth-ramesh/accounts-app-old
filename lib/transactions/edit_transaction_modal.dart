import 'package:accounts2/actions/get_accounts.dart';
import 'package:accounts2/transactions/dropdown_button.dart';
import 'package:flutter/material.dart';

import '../actions/get_transactions.dart';

class EditTransaction extends StatefulWidget {
  final Transaction transaction;

  const EditTransaction({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<EditTransaction> createState() => _EditTransactionState();
}

class _EditTransactionState extends State<EditTransaction> {
  Map<int, String> accountList = {};
  int acc1 = -1;
  int acc2 = -1;
  double amt = -1;

  @override
  void initState() {
    super.initState();
    gaccounts();
    amt =  widget.transaction.amt;
  }

  void gaccounts() async {
    var accList = await getAccounts();
    setState(() {
      accountList = accList;
    });
  }

  int getAccountNumFromAccName(String accName) {
    for (var mapVal in accountList.entries) {
      if (mapVal.value == accName) {
        return mapVal.key;
      }
    }
    return -1;
  }

  int getStateOrDefault(int cur, String accName) {
    if (cur < 0) {
      return getAccountNumFromAccName(accName);
    } else {
      return cur;
    }
  }

  @override
  Widget build(BuildContext context) {
    var curAcc1 = getStateOrDefault(acc1, widget.transaction.acc1);
    var curAcc2 = getStateOrDefault(acc2, widget.transaction.acc2);

    return SimpleDialog(
      titlePadding: const EdgeInsets.all(16),
      title: Text(
        "Edit Transaction",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Column(
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //
              //       ],
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              //     ),
              //   ],
              // ),
              Table(
                defaultColumnWidth: const IntrinsicColumnWidth(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,

                children: [
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("From"),
                    ),
                    ChooseAccount(
                      current: curAcc1,
                      accounts: accountList,
                      callback: (int x) {
                        setState(() {
                          acc1 = x;
                        });
                      },
                    ),
                  ]),
                  TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("To"),
                      ),
                      ChooseAccount(
                        current: curAcc2,
                        accounts: accountList,
                        callback: (int x) {
                          setState(() {
                            acc2 = x;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
