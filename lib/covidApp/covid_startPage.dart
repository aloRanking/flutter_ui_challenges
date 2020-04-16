import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CovidStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Color(0xFF2E4040)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'STAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    'SAFE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SafetyCard(
                          image: 'images/hand_wash.png',
                          text: 'Wash Hands with Soap often',
                        )
                      ),
                      Expanded(
                        child: SafetyCard(
                          image: 'images/dont_touch.png',
                          text: 'Aviod touching your Eyes, Nose and Mouth',
                        )
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Expanded(
                        child: SafetyCard(
                          image: "images/wash_fruits.png" ,
                          text: 'Wash Fruits before Eating',
                        ),
                      ),
                      Expanded(
                        child: SafetyCard(
                          image: "images/dont_touch.png",
                          text: 'Sneeze into a tissue or to ur elbow',
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20,),

                  RawMaterialButton(
                    constraints: BoxConstraints.expand(
                      height: 50.0,
                    ),
                    onPressed: () {},
                    elevation: 5.0,
                    fillColor: Color(0xFFFFCA60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'View Cases',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'NCDC HelpLines',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      FaIcon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                      ),
                      FaIcon(
                        FontAwesomeIcons.whatsapp,
                          color: Colors.white
                      ),
                      FaIcon(
                        FontAwesomeIcons.twitter,
                          color: Colors.white
                      )
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SafetyCard extends StatelessWidget {
  final String image;
  final String text;

  SafetyCard({this.image, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(image,
          width: 80.0,
          height: 80.0,),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFCA60),
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
