import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum Food { veg, nonVeg, chicken }

class FoodHomePage extends StatefulWidget {
  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.format_list_bulleted,
          color: Color(0xFFFFCA60),
        ),
      ),
      body: FoodPage(),
    );
  }
}

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

Food selectedFood = Food.veg;

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8.0),
              child: Text(
                'Choose the \nfood you love',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Color(0xFFFFCA60),
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              ListTab(
                onPressed: () {
                  setState(() {
                    selectedFood = Food.veg;
                  });
                },
                tabText: 'Veg Dinner',
                tabColor:
                    selectedFood == Food.veg ? Color(0xFFFFCA60) : Colors.white,
                textColor:
                    selectedFood == Food.veg ? Colors.white : Color(0xFFFFCA60),
              ),
              ListTab(
                onPressed: () {
                  setState(() {
                    selectedFood = Food.nonVeg;
                  });
                },
                tabText: 'Non-Veg Dinner',
                tabColor: selectedFood == Food.nonVeg
                    ? Color(0xFFFFCA60)
                    : Colors.white,
                textColor: selectedFood == Food.nonVeg
                    ? Colors.white
                    : Color(0xFFFFCA60),
              ),
              ListTab(
                onPressed: () {
                  setState(() {
                    selectedFood = Food.chicken;
                  });
                },
                tabText: 'Chicken Dinner',
                tabColor: selectedFood == Food.chicken
                    ? Color(0xFFFFCA60)
                    : Colors.white,
                textColor: selectedFood == Food.chicken
                    ? Colors.white
                    : Color(0xFFFFCA60),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(),
                      ),
                      hintText: 'Enter a search term'),
                ),
              ),
            ),

            SizedBox( width: 10,),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 8.0),
                height: 50,
                width: 30,
                decoration: BoxDecoration(
                  color: Color(0xFFFFCA60),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),


      ],
    );
  }
}

class ListTab extends StatelessWidget {
  final String tabText;
  final Color tabColor;
  final Color textColor;
  final Function onPressed;

  ListTab({this.tabText, this.textColor, this.tabColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 8.0),
        width: 150.0,
        decoration: BoxDecoration(
            color: tabColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Color(0xFFFFCA60), width: 1)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            tabText,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

/**/
