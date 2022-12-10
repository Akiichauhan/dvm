//import 'dart:convert';

//import 'package:http/http.dart' as http;
/*
class ApiCall {
  final apiBaseUrl = "https://darjisamajbayad.com/api";

  Future<List> PostApi(String reqdata, {String path = ""}) async {
    try {
      var request = await http.post(Uri.parse("$baseUrl/$path"),
          body: jsonDecode(reqdata));
      if (request.statusCode == 200) {
        return [json.decode(request.body)];
      } else {
        return [false, "SOmething Went Wrong "];
      }
    } catch (e) {
      return [false, e];
    }
  }
}

*/