import 'package:flutter/material.dart';

class myPath extends StatelessWidget {
  final innerColor;

  final outerColor;
  final child;

  myPath({this.innerColor, this.child, this.outerColor});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: EdgeInsets.all(20),
          color: outerColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: innerColor,
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
