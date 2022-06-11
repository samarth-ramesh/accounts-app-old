import 'package:accounts2/actions/get_transactions.dart';
import 'package:accounts2/transactions/add_transaction_modal.dart';
import 'package:accounts2/transactions/transaction_item.dart';
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

  void opf(){
    showDialog(context: context, builder: (BuildContext ctx) => AddTransactionModal());
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
        children: List.from(transactions.map((e) => TransactionItem(t: e, key: Key(e.id.toString()),))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: opf,
        child: const Icon(Icons.add),
      ),
    );
  }
}
