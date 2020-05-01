import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_challenges/foodApp/food_model.dart';

class FoodDetailPage extends StatefulWidget {
  final Food food;

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
  final Food food;

  FoodDetail({this.food});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> with TickerProviderStateMixin{
  int foodCount = 1;
  AnimationController animationController;
  Animation<double> animation;
  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFFFCA60),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Hero(
                      tag: widget.food.id,
                      child: Container(
                        width: 300,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(widget.food.imageLink),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity1,
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 140.0,
                  itemCount: widget.food.smallImages.length,
                  itemBuilder: (context, index) {
                    return SmallFoodCardList(
                      imageLink: widget.food.smallImages[index],
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: opacity2,
              child: Container(
                padding: EdgeInsets.all(10.0),
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
                    AnimatedOpacity(
                      opacity: opacity3,
                      duration: Duration(milliseconds: 500),
                      child: Row(
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
                                      onTap: () {
                                        setState(() {
                                          if(foodCount == 0){
                                            return;
                                          }else
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
                                      onTap: () {
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
                          SizedBox(
                            width: 30.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SmallFoodCardList extends StatelessWidget {
  final String imageLink;

  SmallFoodCardList({this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.white,
        image:
            DecorationImage(image: AssetImage(imageLink), fit: BoxFit.cover),
      ),
    );
  }
}
