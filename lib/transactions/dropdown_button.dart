import 'package:flutter/material.dart';

class ChooseAccount extends StatefulWidget {
  int current;
  final Map<int, String> accounts;
  final Function(int) callback;

  ChooseAccount(
      {Key? key,
      required this.current,
      required this.accounts,
      required this.callback})
      : super(key: key);

  @override
  State<ChooseAccount> createState() => _ChooseAccountState();
}

typedef MenuItemType = DropdownMenuItem<int>;

class _ChooseAccountState extends State<ChooseAccount> {
  List<MenuItemType> _get_items() {
    List<MenuItemType> rv = [];
    widget.accounts.forEach((key, value) {
      rv.add(
        DropdownMenuItem(child: Text(value), value: key,)
      );
    });
    return rv;
  }

  @override
  Widget build(BuildContext context) {
    int? cur = widget.current;
    if (cur < 0){
      cur = null;
    }
    return DropdownButton<int>(items: _get_items(), onChanged: (int? next){
      if (next != null){
        widget.callback(next);
      }
    }, value: cur,);
  }
}
