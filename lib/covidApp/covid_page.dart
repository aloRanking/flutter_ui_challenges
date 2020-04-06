import 'package:flutter/material.dart';

class CovidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ Colors.teal, Color(0xFF2E4040)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,

            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.wb_sunny,color: Color(0xFFE5E5E5),),
                    Text(
                      'COVID19',
                      style: TextStyle(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    Icon(Icons.dashboard,color: Color(0xFFE5E5E5),),
                  ],
                ),

                Stack(
                  children: <Widget>[
                    Text(
                      'STAY AT HOME',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE5E5E5),
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),),

      ),
    );


  }
}


/*
backgroundColor: Colors.teal,
appBar: AppBar(
leading: Icon(
Icons.wb_sunny,
),
elevation: 0,
backgroundColor: Colors.teal,
),*/

/*
OkHttpClient client = new OkHttpClient();

Request request = new Request.Builder()
    .url("https://covid-19-data.p.rapidapi.com/totals?format=undefined")
    .get()
    .addHeader("x-rapidapi-host", "covid-19-data.p.rapidapi.com")
    .addHeader("x-rapidapi-key", "083b4276f6mshf879b92d4592dcdp16b4c2jsn1c6468331975")
    .build();*/
