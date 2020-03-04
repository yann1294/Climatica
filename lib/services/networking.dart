import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class NetworkHelper {


  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      var decoratedData = jsonDecode(data);

      return decoratedData;
    } else {
      print(response.statusCode);
    }
  }
}