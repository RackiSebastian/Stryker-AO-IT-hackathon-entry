import 'package:flutter/material.dart';

class Failed extends StatelessWidget {
  const Failed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text("Pay to try again, time exceeded!"),
    ));
  }
}
