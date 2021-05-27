import 'package:flutter/material.dart';
import 'package:pacman/screens/NavigationBar.dart';
import 'package:pacman/screens/Register.dart';
import 'package:pacman/screens/home_pac.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: (Column(
        children: <Widget>[
          NavigationBar(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 250,
                height: 250,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage("assets/images/plus.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PacHome()));
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          image: AssetImage("assets/images/pac.png"))),
                ),
              ),
              SizedBox(
                width: 20,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Crossing Miles,",
                      style: TextStyle(color: Colors.yellow, fontSize: 70),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Bringing Smiles,",
                      style: TextStyle(color: Colors.black, fontSize: 60),
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/map.JPG"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/map.JPG"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 500,
                    width: 500,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/map.JPG"),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Challenge Others,",
                      style: TextStyle(color: Colors.yellow, fontSize: 75),
                    ),
                  ]),
            ],
          )
        ],
      )),
    );
  }
}
