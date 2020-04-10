import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  String host = "covid-19-data.p.rapidapi.com";


  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url, headers: {
      "x-rapidapi-host": host,
      "x-rapidapi-key": _ApiKey,
    });

    try {
      if (response.statusCode == 200) {
        String data = response.body;

        print(data);
        return jsonDecode(data);
      } else
        print(response.statusCode);
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }

  Future postData() async {
    //http.Response response = await http.get(url, headers: {"x-rapidapi-host": host, "x-rapidapi-key": _ApiKey, });

    http.Response response = await http.post(
      url,
      headers: {
        "x-rapidapi-host": host,
        "x-rapidapi-key": _ApiKey,
      },
    );

    try {
      if (response.statusCode == 200) {
        String data = response.body;

        return jsonDecode(data);
      } else
        print(response.statusCode);
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
