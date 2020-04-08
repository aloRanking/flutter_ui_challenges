
import 'package:flutter_ui_challenges/covidApp/services/networking.dart';

const covidAPI = 'https://covid-19-data.p.rapidapi.com/totals?format=undefined';

class Covid{

  String confirmed;
  String recorverd;
  String critical;
  String death;








  Future<dynamic> getCovidTotalResult() async{

    NetworkHelper networkHelper = NetworkHelper('$covidAPI');

    var covidData = await networkHelper.getData();


    print(covidData);
    return covidData;


  }

  Future<dynamic> getCovidCountryResult(String country){

    var url = '$covidAPI&name=$country';

    NetworkHelper networkHelper = NetworkHelper('$url');

  }

  void getCovidData(){



  }
}