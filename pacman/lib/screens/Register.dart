import 'package:flutter/material.dart';
import 'package:pacman/screens/HomeView.dart';
import 'package:pacman/screens/donate.dart';
import 'package:pacman/screens/home_pac.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    void _onRememberMeChanged(bool newValue) => setState(() {
          rememberMe = newValue;

          if (rememberMe) {
            // TODO: Here goes your functionality that remembers the user.
          } else {
            // TODO: Forget the user
          }
        });
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Stack(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 600,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/stryker.png"),
                              fit: BoxFit.fill)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Be the reason behind the smile",
                      style: TextStyle(color: Colors.yellow, fontSize: 80),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.white.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Sign in to your account!",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text("Email:"),
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Form(
                                child: TextFormField(
                                  controller: null,
                                  cursorColor: Colors.black,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text("Password:"),
                          SizedBox(
                            width: 23,
                          ),
                          Container(
                            height: 50,
                            width: 300,
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child: Form(
                                child: TextFormField(
                                  controller: null,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                              value: rememberMe,
                              onChanged: _onRememberMeChanged),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            "Remember Me!",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: Colors.blue),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width * 0.07,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                color: Colors.blue,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donate()));
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
