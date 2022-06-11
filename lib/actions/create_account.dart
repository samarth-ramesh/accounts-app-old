import 'dart:convert';

import 'package:accounts2/actions/bearer_token.dart';
import 'package:accounts2/actions/get_accounts_long.dart';
import 'package:accounts2/actions/get_transactions.dart';
import 'package:accounts2/actions/login.dart';
import 'package:http/http.dart';

Future<Account> createAccount(String name) async {
  var body = jsonEncode({
    "Name": name
  });

  final resp = await post(Uri.parse("$baseUrl/accounts/create"), headers: getHeaders(token), body: body);
  if (resp.statusCode != 200){
    throw resp.statusCode;
  }

  return Account.fromJSON(jsonDecode(resp.body));
}