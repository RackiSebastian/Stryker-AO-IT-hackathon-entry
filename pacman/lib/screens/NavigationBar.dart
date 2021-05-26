import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pacman/screens/LoginPage.dart';
import 'package:pacman/screens/Register.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 80,
            width: 150,
            child: Image.asset("assets/images/stryker.png"),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _NavBarItem1('Donations'),
              SizedBox(width: 60),
              _NavBarItem2('Scoreboard'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem2("MyAccount"),
              SizedBox(
                width: 60,
              ),
              Icon(Icons.lock),
              _NavBarItem2("Logout")
            ],
          ),
        ],
      ),
    );
  }
}

class _NavBarItem1 extends StatelessWidget {
  final String title;
  const _NavBarItem1(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(color: Colors.yellow, fontSize: 24),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }),
    );
  }
}

class _NavBarItem2 extends StatelessWidget {
  final String title;
  const _NavBarItem2(
    this.title, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: TextStyle(color: Colors.yellow, fontSize: 24),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            }),
    );
  }
}
