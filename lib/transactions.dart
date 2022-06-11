import 'package:accounts2/actions/getTransactions.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  List<Transaction> transactions = [];
  @override
  initState(){
    super.initState();
    getTrans();
  }

  void getTrans() async {
    var trans = await getTransactions();
    setState((){
      transactions = trans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            TextButton(onPressed: (){}, child: const Text("Transactions"))
          ]
        ),
      ),
      appBar: AppBar(
        title: const Text("Transactions"),
      ),
      body: Column(

      ),
    );
  }
}
