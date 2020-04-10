
import 'package:flutter_ui_challenges/covidApp/services/networking.dart';


const covidLiveStat = 'https://covid-19-live-stats.p.rapidapi.com/';

const covidAPI = 'https://covid-19-data.p.rapidapi.com/';



class Covid{

  String confirmed;
  String recovered;
  String critical;
  String death;








  Future<dynamic> getCovidTotalResult() async{

    var url = covidAPI +'totals?format=undefined';

    NetworkHelper networkHelper = NetworkHelper('$url');

    var covidData = await networkHelper.getData();


    print(covidData);
    return covidData;


  }

  Future<dynamic> getCovidCountryResult(String country) async {

    var url = covidAPI +'country?format=undefined&name=$country';

    NetworkHelper networkHelper = NetworkHelper('$url');
    var covidData = await networkHelper.getData();




    return covidData;

  }

  void getCovidData(){



  }
}