import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      child: Scaffold(

          body: FoodDetail(food: widget.food)),
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
  int foodCount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[

        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFFFCA60),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0)),

            ),
            child: Container(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular((30.0),),
                  child: Hero(
                    tag: widget.food.id,
                    child: Image.network(widget.food.imageLink,
                    ),
                  ),
                ),
              ),

            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            margin: EdgeInsets.only(top:10.0, left: 10.0),
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 100.0,
              itemCount: widget.food.smallImages.length,
              itemBuilder: (context,index){
                return SmallFoodListCard(imageLink: widget.food.smallImages[index],);
              },


            ),

          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Lunch & Dinner / Monthly Dinner',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF707070),
                  ),
                ),
                Text(
                  'Monthly Dinner',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF444444),
                  ),
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

                Text(
                  'Only for Bhuhaba, Odisha ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF707070),
                  ),
                ),
                Text(
                'Contact us for more Info : +2348133333333 ',
                style: TextStyle(
                fontSize: 16.0,
                color: Color(0xFF707070),
                ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFCA60),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(

                                onTap: (){
                                  setState(() {
                                    foodCount--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '$foodCount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    foodCount++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 30.0,),
                    Expanded(
                      flex: 2,
                      child: RawMaterialButton(
                        constraints: BoxConstraints.tightFor(
                          height: 50.0,
                        ),
                        onPressed: (){

                        },
                        elevation: 5.0,
                        fillColor: Color(0xFFFFCA60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Buy now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SmallFoodListCard extends StatelessWidget {
  final String imageLink;

  SmallFoodListCard({this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0),),
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(imageLink),
          fit: BoxFit.cover
        ),


      ),

    );
  }
}

