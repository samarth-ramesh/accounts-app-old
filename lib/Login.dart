import 'package:flutter/material.dart';
import 'package:accounts2/actions/login.dart' as lg;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class st {
  String uname = "";
  String passwd = "";
}

class _LoginState extends State<Login> {
  var state = st();
  var padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  void ss(String name, String val) {
    switch (name) {
      case "uname": {
        state.uname = val;
        break;
      }
      default: {
        state.passwd = val;
      }
    }
  }

  void login() async {
    var res = await lg.login(state.uname, state.passwd);
    if (res == "INVALID_PASSWD"){
      
    }
  }

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: padding,
          child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Login!'),
            onChanged: (String s) {
              ss("uname", s);
            },
          ),
        ),
        Padding(
          padding: padding,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Password',
            ),
            autocorrect: false,
            obscureText: true,
            autofillHints: const ['Password'],
            onChanged: (String s) {
              ss("passwd", s);
            },
          ),
        ),
        Padding(
          padding: padding,
          child: ElevatedButton(
            onPressed: login,
            child: const Text("Login!"),
          ),
        )
      ],
    );
  }
}
