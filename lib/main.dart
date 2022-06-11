import 'package:accounts2/Login.dart';
import 'package:accounts2/accounts.dart';
import 'package:accounts2/transactions/transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Login(),
        '/transactions': (context) => const TransactionsPage(),
        '/accounts' : (context) => const AccountsPage()
      },
    );
  }
}
