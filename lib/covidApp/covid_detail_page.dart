import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_challenges/covidApp/covid_constants.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'covid_model.dart';

class CovidDetailPage extends StatefulWidget {

  final  covidata;


  CovidDetailPage(this.covidata);

  @override
  _CovidDetailPageState createState() => _CovidDetailPageState();
}

class _CovidDetailPageState extends State<CovidDetailPage> {
  Covid covid = Covid();

  /*String confirmed;
  String recovered;
  String critical;
  String death;*/
  TextEditingController textEditingController = TextEditingController();

  String confirmedCases, recoveredCases, deathCases, criticalCases;
  int confirmedChart, recoveredChart, deathChart, criticalChart;
  String searchQuery;
  String searchCountry = 'Total Case';



  String getDate(){
    var dt = DateTime.now();
    var newDt = DateFormat.yMMMEd().format(dt);
    print(newDt);  // Fri, Apr 3, 2020
    return newDt;
  }

  @override
  void initState() {
    super.initState();

    updateUI(widget.covidata);
  }


  updateUI(var covidata) {
    if (covidata == null) {
      /*death = 0;
      confirmed = 0;
      critical = 0;
      recovered = 0;*/
      deathCases = '0';
      confirmedCases = '0';
      criticalCases = '0';
      recoveredCases = '0';
    } else {
      String conf = covidata[0]['confirmed'].toString();
      confirmedCases = addComma(conf);
      confirmedChart = int.parse(conf);

      String recov = covidata[0]['recovered'].toString();
      recoveredCases = addComma(recov);
      recoveredChart = int.parse(recov);

      String crit = covidata[0]['critical'].toString();
      criticalCases = addComma(crit);
      criticalChart = int.parse(crit);

      String dth = covidata[0]['deaths'].toString();
      deathCases = addComma(dth);
      deathChart = int.parse(dth);
    }
  }


  _submit(String country) async{
    print(country);
    var covidataCountry = await covid.getCovidCountryResult(country);

    //var covidataCountry = covidataCountryi.toString();

    print(covidataCountry);

    if (covidataCountry == null) {

      setState(() {
        deathCases = '0';
        confirmedCases = '0';
        criticalCases = '0';
        recoveredCases = '0';
      });

    } else {
      setState(() {
        confirmedChart = covidataCountry[0]['confirmed'];
        confirmedCases = addComma(confirmedChart.toString());

        recoveredChart = covidataCountry[0]['recovered'];
       recoveredCases = addComma(recoveredChart.toString());

         criticalChart = covidataCountry[0]['critical'];
       criticalCases = addComma(criticalChart.toString());

       deathChart = covidataCountry[0]['deaths'];
        deathCases = addComma(deathChart.toString());

      });

    }


  }

  String addComma(String number){
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';
    return number.replaceAllMapped(reg, mathFunc);
  }


    @override
    Widget build(BuildContext context) {

      final List<CovidChart> covidChartData = [
        CovidChart(title: 'Confirmed', numberOfCase: confirmedChart, color: kConfirmedColor),
        CovidChart(title: 'Critical', numberOfCase: criticalChart, color: kCriticalColor),
        CovidChart(title: 'Recovered', numberOfCase: recoveredChart, color: kRecoveredColor),
        CovidChart(title: 'Deaths', numberOfCase: deathChart, color:kDeathColor )
      ];
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.teal, Color(0xFF2E4040)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0)),
                      ),
                      child: Container(
                        child: Column(

                          children: <Widget>[


                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 70,
                                  width: 350,
                                  margin: EdgeInsets.symmetric(vertical: 10,
                                      horizontal: 8),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[


                                      Container(
                                        height: 50.0,
                                        width: 300.0,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            hintText: 'Search Country',
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color: Colors.black54,
                                            ),

                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30.0)),
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
                                          ),
                                          controller: textEditingController,
                                          onChanged: (value) {

                                            searchQuery = value;
                                            searchCountry = value;

                                          },
                                        ),
                                      ),
                                      Positioned(

                                        right: 10.0,
                                        child: GestureDetector(
                                          onTap: (){
                                            _submit (searchQuery);

                                            },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 8.0),
                                            //alignment: FractionalOffset.centerRight,

                                            height: 60,
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    searchCountry.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                Text(
                                  getDate(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  )

                                )
                              ],
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[

                                  Expanded(
                                    child: CovidCard(
                                      title: 'Confirmed',
                                      dailyCases: 20,
                                      cases: '$confirmedCases',
                                      color: kConfirmedColor,
                                    ),
                                  ),
                                  Expanded(
                                    child: CovidCard(
                                      title: 'CRITICAL',
                                      dailyCases: 20,
                                      cases: '$criticalCases',
                                      color: kCriticalColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[

                                  Expanded(
                                    child: CovidCard(
                                      title: 'RECOVERED',
                                      dailyCases: 20,
                                      cases: '$recoveredCases',
                                      color: kRecoveredColor,
                                    ),
                                  ),

                                  Expanded(
                                    child: CovidCard(
                                      title: 'DECEASED',
                                      dailyCases: 20,
                                      cases: '$deathCases',
                                      color: kDeathColor,
                                    ),
                                  ),
                                ],
                              ),),
                            SizedBox(height: 30.0,)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 250.0,
                      child: SfCircularChart(
                          legend: Legend(isVisible: true,
                          textStyle: ChartTextStyle(
                            color: Colors.white,
                          )),
                        series: <CircularSeries>[

                          PieSeries<CovidChart, String>(
                              dataSource: covidChartData,
                              pointColorMapper:(CovidChart data,  _) => data.color,
                              xValueMapper: (CovidChart data, _) => data.title,
                              yValueMapper: (CovidChart data, _) => data.numberOfCase
                          )

                        ]



                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }


}

class CovidChart{
  final String title;
  final int numberOfCase;
  final Color color;

  CovidChart({this.title, this.numberOfCase, this.color});


}


class CovidCard extends StatelessWidget {
 final String title;
 final int dailyCases;
 final String cases;
 final Color color;


 CovidCard({this.title, this.dailyCases, this.cases, this.color});

 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,

      margin: EdgeInsets.all(10.0),
      /*decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),*/
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
