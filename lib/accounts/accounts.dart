import 'package:accounts2/accounts/all_accounts.dart';
import 'package:accounts2/navbar.dart';
import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Accounts"),
        ),
        drawer: const Navbar(),
        body: const AccountList()
    );
  }
}
