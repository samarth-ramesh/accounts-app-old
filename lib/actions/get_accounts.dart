import 'dart:convert';

import 'package:accounts2/actions/bearer_token.dart';
import 'package:accounts2/actions/get_transactions.dart';
import 'package:accounts2/actions/login.dart';
import 'package:http/http.dart' as http;
Future<Map<String, int>> getAccounts() async {
  final resp = await http.post(Uri.parse("$baseUrl/accounts/list"), headers: getHeaders(token), body: '{}');
  
  if (resp.statusCode != 200){
    throw resp.statusCode;
  }

  var body = jsonDecode(resp.body);

  var accountList = body['Accounts'];

  var rv = <String, int>{};

  accountList.forEach((e){
    rv[e['Name']] = e['Id'];
  });

  return rv;
}