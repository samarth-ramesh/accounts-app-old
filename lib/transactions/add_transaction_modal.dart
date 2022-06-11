import 'package:accounts2/transactions/dropdown_button.dart';
import 'package:flutter/material.dart';

class AddTransactionModal extends StatefulWidget {
  const AddTransactionModal({Key? key}) : super(key: key);

  @override
  State<AddTransactionModal> createState() => _AddTransactionModalState();
}

class _AddTransactionModalState extends State<AddTransactionModal> {
  String s1 = "";
  String s2 = "";
  String amt = "";

  void sets1(String s) {
    setState(() {
      s1 = s;
    });
  }

  void sets2(String s) {
    setState(() {
      s2 = s;
    });
  }

  @override
  initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("Create Account", textAlign: TextAlign.center,),
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
                        ChooseAccount(s: ['foo', 'bar'], f: sets1, cur: s1)
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("To"),
                      ChooseAccount(s: ['bar', 'baz'], f: sets2, cur: s2)
                    ],
                  )
                ],
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Amount"),
                  border: OutlineInputBorder()
                ),
                onChanged: (String s){
                  setState((){
                    amt = s;
                  });
                },
              )
            ],
          )
        )
      ],
    );
  }
}
