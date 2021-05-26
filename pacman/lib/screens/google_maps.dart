import 'package:flutter/material.dart';
import 'package:pacman/screens/maps.dart';

class googleAPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: getMap(),
      ),
    );
  }
}
