import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;
  String host = "covid-19-data.p.rapidapi.com";
  String _ApiKey = '083b4276f6mshf879b92d4592dcdp16b4c2jsn1c6468331975';

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(url, headers: {
      "x-rapidapi-host": host,
      "x-rapidapi-key": _ApiKey,
    });

    try {
      if (response.statusCode == 200) {
        String covidata = response.body;

        print(covidata);
        return jsonDecode(covidata);
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
        String covidata = response.body;

        return jsonDecode(covidata);
      } else
        print(response.statusCode);
    } on Exception catch (e) {
      // TODO
      print(e);
    }
  }
}
