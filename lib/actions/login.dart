import 'dart:convert';

import 'package:http/http.dart' as http;

const baseUrl = "https://ac.samarth.gq";

String formBuilder(String uname, String passwd) {
  return "grant_type=&username=${Uri.encodeComponent(uname)}&password=${Uri.encodeComponent(passwd)}&scope=&client_id=&client_secret=";
}

String extractBearer(String body){
  var m = jsonDecode(body);
  if ((m["access_token"].toString().isNotEmpty)){
    return m["access_token"];
  } else {
    return "";
  }
}

Future<String> login(String uname, String passwd) async {
  var formBody = formBuilder(uname, passwd);
  final resp = await http.post(
    Uri.parse("$baseUrl/login"),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: formBody,
  );
  if (resp.statusCode != 200){
    return "INVALID_PASSWD";
  } else {
    return extractBearer(resp.body);
  }
}
