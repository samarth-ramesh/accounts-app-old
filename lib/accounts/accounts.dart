import 'package:accounts2/accounts/all_accounts.dart';
import 'package:accounts2/accounts/create_account.dart';
import 'package:accounts2/navbar.dart';
import 'package:flutter/material.dart';

import '../actions/get_accounts_long.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  void opf(BuildContext context) async {
    Account? acc = showDialog(context: context, builder: (BuildContext ctx) => const CreateAccount()) as Account?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts"),
      ),
      drawer: const Navbar(),
      body: const AccountList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {opf(context);},
      ),
    );
  }
}
