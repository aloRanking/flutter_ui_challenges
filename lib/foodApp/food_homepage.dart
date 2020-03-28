import 'package:flutter/material.dart';

class FoodHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: FoodPage(),
      ),
    );
  }
}

class FoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.format_list_bulleted,
            color: Color(0xFFFFCA60),
          ),
        ) ,
        Row(
          children: <Widget>[
            Text(
              'Choose the \nfood you love',
              style: TextStyle(
                fontSize: 50.0,
                color: Color(0xFFFFCA60),
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
















      ],
    );
  }
}

