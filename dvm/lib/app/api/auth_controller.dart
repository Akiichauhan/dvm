import 'dart:convert';
import 'dart:developer';

import 'package:dvm/app/model/auth/login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import '../widget/second_tab.dart';

//https://www.youtube.com/watch?v=nYl1M9wJxQ4
//https://www.youtube.com/watch?v=CFLR_6gB70A
//https://www.youtube.com/watch?v=auspHSmtVII

//https://www.youtube.com/watch?v=l59VGNbenLk

//https://www.youtube.com/watch?v=nYl1M9wJxQ4
//https://www.youtube.com/watch?v=CFLR_6gB70A
//https://www.youtube.com/watch?v=auspHSmtVII

// can i con

class AuthC extends ChangeNotifier {
  Future<LoginModel> login(String number) async {
    // if (number.isNotEmpty) {
    const url = "https://darjisamajbayad.com/api/login";
    // ignore: unused_label
    headers:
    <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await https.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          "mobile_no": number,
        },
      ),
    );
    var resData = jsonDecode(response.body);
    var data = resData['data'];
    // notifyListeners();

    // should i run this code yes

    if (response.statusCode == 200) {
      // print(data.toList);
      log(" token = ${resData["token"]}");
      log("name is  = ${data["name"]}");
      log("name is  = ${data["village"]}");
      print('response12 ${response.body} ');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("login", resData["token"]);
      prefs.setString("login", resData["token"]);
      print('response12 ${response.statusCode} ');
      return loginModelFromJson(response.body);
      // notifyListeners();
    } else {
      const Text("Invalid Creditial");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      // i am explain u wait a 2 sec >

      // u plz con>  ok i am run app

      await prefs.setString(
        "login",
        resData['token'].toString(),
      );
      log(resData.token);
      pageRoute(resData['token']);
    } // sir i tthing it postmen code will help u

    log(resData.toString());

    return resData;
  }

  // return data['data'];
}

void pageRoute(String token) async {
  BuildContext? context;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("login", token);
  Navigator.push(context!,
      MaterialPageRoute(builder: (context) => const PaymentHistoryContainer()));
}
/* 
class AuthController {
  Future login(String number) async {
    if (number.isNotEmpty) {
      const url = "https://darjisamajbayad.com/api/login";
      // ignore: unused_label
      headers:
      <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var response = await https.post(
        Uri.parse(url),
        body: jsonEncode(
          {
            "mobile_no": number,
          },
        ),
      );
      var resData = jsonDecode(response.body);
      // var data = resData['data'];

      // should i run this code yes

      if (response.statusCode == 200) {
        // print(resData['data'] as List);
        log(" token = ${resData["token"]}");
        log("name is ");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("login", resData["token"]);
        prefs.setString("login", resData["token"]);
      } else {
        const Text("Invalid Creditial");

        SharedPreferences prefs = await SharedPreferences.getInstance();

        // i am explain u wait a 2 sec >
        // u plz con>  ok i am run app

        await prefs.setString(
          "login",
          resData['token'],
        );
        log(resData.token);
        pageRoute(resData['token']);
      } // sir i tthing it postmen code will help u

      log(resData.toString());

      return resData;
    } else {
      const Text("Bliend Velue");
    }

    // return resData['data'];
  }

  void pageRoute(String token) async {
    BuildContext? context;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("login", token);
    Navigator.push(
        context!,
        MaterialPageRoute(
            builder: (context) => const PaymentHistoryContainer()));
  }
}
 */