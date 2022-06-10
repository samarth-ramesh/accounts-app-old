import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var state = <String, String>{};
  var padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  void ss(String name, String val) {
    setState(() {
      state[name] = val;
      // print(state);
    });
  }

  void login(){
    
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
