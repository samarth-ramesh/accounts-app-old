import 'package:accounts2/actions/get_accounts.dart';
import 'package:accounts2/transactions/dropdown_button.dart';
import 'package:flutter/material.dart';

class AddTransactionModal extends StatefulWidget {
  const AddTransactionModal({Key? key}) : super(key: key);

  @override
  State<AddTransactionModal> createState() => _AddTransactionModalState();
}

class _AddTransactionModalState extends State<AddTransactionModal> {
  int s1 = -1;
  int s2 = -1;
  String amt = "";
  Map<int, String> accounts = {};

  void sets1(int s) {
    setState(() {
      s1 = s;
    });
  }

  void sets2(int s) {
    setState(() {
      s2 = s;
    });
  }

  @override
  initState() {
    super.initState();
    gaccounts();
  }

  void gaccounts() async {
    var acc = await getAccounts();
    setState(() {
      accounts = acc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        "Create Account",
        textAlign: TextAlign.center,
      ),
      titlePadding: const EdgeInsets.all(8),
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("From"),
                          ChooseAccount(
                            current: s1,
                            accounts: accounts,
                            callback: sets1,
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("To"),
                        ChooseAccount(
                            current: s2, accounts: accounts, callback: sets2)
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        label: Text("Amount"), border: OutlineInputBorder()),
                    onChanged: (String s) {
                      setState(() {
                        amt = s;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Create!")),
                )
              ],
            ))
      ],
    );
  }
}
