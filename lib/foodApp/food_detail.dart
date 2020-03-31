import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/foodApp/food_model.dart';

class FoodDetailPage extends StatefulWidget {
  final Foood food;

  FoodDetailPage({this.food});

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: FoodDetail(food: widget.food)),
    );
  }
}

class FoodDetail extends StatefulWidget {
  final Foood food;

  FoodDetail({this.food});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 350.0,
          decoration: BoxDecoration(
            color: Color(0xFFFFCA60),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Hero(
            tag: widget.food.id,
            child: Image.network(widget.food.imageLink),
          ),
        ),
        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Lunch & Dinner / Monthly Dinner \n \n',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF707070),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Monthly Dinner \n',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF444444),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              '\$5.0 ',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF707070),
                ),
            )
          ],
        ),

        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Only for Bhuhaba, Odisha \n \n',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF707070),
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Contact us for more Info : +2348133333333 \n',
                    style: TextStyle(
                      fontSize: 16.0,

                      color: Color(0xFF444444),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
