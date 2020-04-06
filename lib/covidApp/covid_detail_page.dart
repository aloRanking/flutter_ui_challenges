import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CovidDetailPage extends StatefulWidget {
  @override
  _CovidDetailPageState createState() => _CovidDetailPageState();
}

class _CovidDetailPageState extends State<CovidDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Color(0xFF2E4040)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 24.0,
                          ),

                          child: Row(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  SizedBox(
                                    height: 40.0,
                                    width: 300.0,
                                    child: TextField(
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
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 8.0),
                                      //alignment: FractionalOffset.centerRight,

                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFFFFCA60),
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
                          ),
                        ),
                        Expanded(
                          child: Row(
                          children: <Widget>[

                            Expanded(
                              child: CovidCard(
                                title: 'Confirmed',
                                dailyCases: 20,
                                cases: '1234',
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: CovidCard(
                                title: 'ACTIVE',
                                dailyCases: 20,
                                cases: '1234',
                                color: Colors.blue,
                              ),
                            ),
                          ],
                          ),
                        ),
                        Expanded(
                          child:Row(
                          children: <Widget>[

                            Expanded(
                              child: CovidCard(
                                title: 'RECORVERD',
                                dailyCases: 20,
                                cases: '1234',
                                color: Colors.greenAccent,
                              ),
                            ),

                            Expanded(
                              child: CovidCard(
                                title: 'DECEASED',
                                dailyCases: 20,
                                cases: '1234',
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ],
                        ),),
                        SizedBox(height: 30.0,)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CovidCard extends StatelessWidget {
 final String title;
 final int dailyCases;
 final String cases;
 final Color color;


 CovidCard({this.title, this.dailyCases, this.cases, this.color});

 @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: color
            ),
          ),
          Text(
            '[$dailyCases]',
            style: TextStyle(
                color: color
            ),
          ),

          Text(
            cases,
            style: TextStyle(
                color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
