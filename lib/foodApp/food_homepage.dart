import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui_challenges/foodApp/food_detail.dart';

import 'food_model.dart';

enum Food { veg, nonVeg, chicken }
String searchQuery;

class FoodHomePage extends StatefulWidget {
  @override
  _FoodHomePageState createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFEF9EE),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFEF9EE),
          leading: Icon(
            Icons.format_list_bulleted,
            color: Color(0xFFFFCA60),
          ),
        ),
        body: FoodPage(),
        bottomNavigationBar: CurvedNavigationBar(
          color: Color(0xFFFEF9EE),
          backgroundColor: Color(0xFFFEF9EE),
          buttonBackgroundColor: Color(0xFFFFCA60),
          items: <Widget>[
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.list,
              size: 30,
            ),
            Icon(
              Icons.compare_arrows,
              size: 30,
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }
}

class FoodPage extends StatefulWidget {




  @override
  _FoodPageState createState() => _FoodPageState();
}

Food selectedFood = Food.veg;

class _FoodPageState extends State<FoodPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);
  }

  Widget getDinner(Food selectedDinner, int index) {
    int count = vegFoods.length;
    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Interval((1 / count) * index, 1.0,
                curve: Curves.fastOutSlowIn)));

    animationController.forward();

    if (selectedDinner == Food.veg) {
      return FoodListCard(
          food: vegFoods[index],
          animation: animation,
          animationController: animationController);
    } else if (selectedDinner == Food.nonVeg) {
      return FoodListCard(
          food: nonVegFoods[index],
          animation: animation,
          animationController: animationController);
    } else
      return FoodListCard(food: vegFoods[index]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  tabColor: selectedFood == Food.veg
                      ? Color(0xFFFFCA60)
                      : Colors.white,
                  textColor: selectedFood == Food.veg
                      ? Colors.white
                      : Color(0xFFFFCA60),
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
                    onChanged: (value) {
                      if (value.isEmpty) {
                        return;
                      } else {
                        setState(() {
                          searchQuery = value;
                        });
                        print(searchQuery);
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            color: Color(0xFFFFCA60),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(
                            color: Color(0xFFFFCA60),
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Search for food'),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: FoodSearch(),
                        query: searchQuery);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8.0),
                    height: 50,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFCA60),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, left: 10.0),
            height: 380.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: 300.0,
              itemCount: vegFoods.length,
              itemBuilder: (context, index) {
                return getDinner(selectedFood, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FoodListCard extends StatelessWidget {
  /*final String imageLink;
  final String foodName;
  final String foodPrice;*/

  final Foood food;
  final Animation animation;
  final AnimationController animationController;

  FoodListCard({this.food, this.animation, this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation.value), 0.0, 0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => FoodDetailPage(food: food),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //margin: EdgeInsets.only(right: 20.0),
                  width: 250.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    color: Color(0xFFFEF9EE),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        offset: const Offset(4, 4),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                        tag: food.id,
                        child: Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(food.imageLink),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          food.foodName,
                          style: TextStyle(
                            color: Color(0xFF444444),
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Tradition vegetarian dinner \nto experience',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF707070),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          '1 person per plate',
                          style: TextStyle(
                            color: Color(0xFF707070),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Just ',
                            style: TextStyle(
                              color: Color(0xFFFFCA60),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: food.foodPrice,
                                style: TextStyle(
                                  color: Color(0xFFFFCA60),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      /*SizedBox(
                        height: 10.0,
                      )*/
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
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

class FoodSearch extends SearchDelegate<Foood> {
  final Foood food;
  FoodSearch({this.food});

  final foodList = [];

  final foodSuggestionList = [
    'Vegeterian Dinner',
    'Lahori Chicken Curry',
    'Malabar Fish Biryan',
    'Efo Riro',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    foodList.clear();
    foodSuggestionList.clear();

    for (var nonvegfood in nonVegFoods) {
      foodList.add(nonvegfood.foodName);
    }
    for (var vegfood in vegFoods) {
      foodSuggestionList.add(vegfood.foodName);
      foodList.add(vegfood.foodName);
    }

    final suggestionList = query.isEmpty
        ? foodSuggestionList
        : foodList.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              query = suggestionList[index];
              vegFoods.map((diet) {
                if (diet.foodName == suggestionList[index]) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                                food: diet,
                              )));
                }
              });
            },
            leading: Icon(Icons.format_shapes),
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                      ))
                ],
              ),
            ),
          );
        });
  }
}

/**/
