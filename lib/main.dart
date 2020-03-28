import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_challenges/foodApp/food_homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Challenges',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI Challenges'),
      ),
      body: Column(

        children: <Widget>[
          ChallengeCard(
            challengeText: 'Challenge 1',
          bcolor: Colors.orange[400],
          fontColor: Colors.black,),

          ChallengeCard(
            challengeText: 'Challenge 2',
            bcolor: Colors.orange[400],
            fontColor: Colors.black,
          ),

        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String challengeText;
  final Color bcolor;
  final Color fontColor;


  ChallengeCard({this.challengeText, this.bcolor, this.fontColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:
        (context)=> FoodHomePage()));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 120.0,
        width: 200.0,
        decoration: BoxDecoration(
          color: bcolor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                challengeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: fontColor,
              fontSize: 20.0,
            ),),
          ],
        ),
      ),
    );
  }
}


