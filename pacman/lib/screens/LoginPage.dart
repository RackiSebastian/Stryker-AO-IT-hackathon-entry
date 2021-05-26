import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          
            child: Container(
              
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        
      ),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Color.fromRGBO(64, 19, 159, 1),
            border: Border.all(color: Color.fromRGBO(64, 19, 159, 1)),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(12, 15),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                SizedBox(height: 110),
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
