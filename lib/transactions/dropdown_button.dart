import 'package:flutter/material.dart';

class ChooseAccount extends StatefulWidget {
  final List<String> s;
  final String cur;
  final Function(String) f;

  const ChooseAccount(
      {Key? key, required this.s, required this.f, required this.cur})
      : super(key: key);

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

class _ChooseAccountState extends State<ChooseAccount> {

  List<DropdownMenuItem<String>> _menuItems(){
    return List.of(widget.s.map((e) => DropdownMenuItem(value: e,child: Text(e),)));
  }

  @override
  Widget build(BuildContext context) {
    var cur = widget.cur;
    if (cur == ""){
      cur = widget.s[0];
    }

    return DropdownButton<String>(
      items: _menuItems(),
      onChanged: (String? s) {
        if (s != null){
          widget.f(s);
        }
      },
      value: cur,
    );
  }
}
