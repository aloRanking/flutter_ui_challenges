import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
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

  String confirmed, recovered, death, critical;
 int confirmedChart, recoveredChart, deathChart, criticalChart;
  String searchQuery;
  String searchCountry = 'Total data';

  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

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
      death = '0';
      confirmed = '0';
      critical = '0';
      recovered = '0';
    } else {
      String conf = covidata[0]['confirmed'];
      confirmed = addComma(conf);
      confirmedChart = int.parse(conf);

      String recov = covidata[0]['recovered'];
      recovered = addComma(recov);
      recoveredChart = int.parse(recov);

      String crit = covidata[0]['critical'];
      critical = addComma(crit);
      criticalChart = int.parse(crit);

      String dth = covidata[0]['deaths'];
      death = addComma(dth);
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
        death = '0';
        confirmed = '0';
        critical = '0';
        recovered = '0';
      });

    } else {
      setState(() {
        confirmedChart = covidataCountry[0]['confirmed'];
        confirmed = confirmedChart.toString();

        recoveredChart = covidataCountry[0]['recovered'];
       recovered = addComma(recoveredChart.toString());

         criticalChart = covidataCountry[0]['critical'];
       critical = criticalChart.toString();

       deathChart = covidataCountry[0]['deaths'];
        death = deathChart.toString();

      });

    }


  }

  String addComma(String number){
    return number.replaceAllMapped(reg, mathFunc);
  }


    @override
    Widget build(BuildContext context) {

      final List<CovidChart> covidData = [
        CovidChart(title: 'Confirmed', numberOfCase: confirmedChart, color: Colors.red),
        CovidChart(title: 'Critical', numberOfCase: criticalChart, color: Colors.blue),
        CovidChart(title: 'Recovered', numberOfCase: recoveredChart, color: Colors.green),
        CovidChart(title: 'Deaths', numberOfCase: deathChart, color: Colors.deepOrange)
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
                        color: Colors.teal,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0)),
                      ),
                      child: Container(
                        child: Column(

                          children: <Widget>[


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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              ],
                            ),
                            Expanded(
                              child: Row(
                                children: <Widget>[

                                  Expanded(
                                    child: CovidCard(
                                      title: 'Confirmed',
                                      dailyCases: 20,
                                      cases: '$confirmed',
                                      color: Colors.red,
                                    ),
                                  ),
                                  Expanded(
                                    child: CovidCard(
                                      title: 'ACTIVE',
                                      dailyCases: 20,
                                      cases: '$critical',
                                      color: Colors.blue,
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
                                      title: 'RECORVERD',
                                      dailyCases: 20,
                                      cases: '$recovered',
                                      color: Colors.green,
                                    ),
                                  ),

                                  Expanded(
                                    child: CovidCard(
                                      title: 'DECEASED',
                                      dailyCases: 20,
                                      cases: '$death',
                                      color: Colors.deepOrange,
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
                              dataSource: covidData,
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
