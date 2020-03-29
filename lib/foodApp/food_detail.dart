import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/foodApp/food_model.dart';

class FoodDetailPage extends StatefulWidget {

  @override
  _FoodDetailPageState createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FoodDetail(),
      ),
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
            color:Color(0xFFFFCA60),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Image.network(widget.food.imageLink),
        ),
      ],
    );
  }
}

