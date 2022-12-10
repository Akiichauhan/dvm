// ignore_for_file: file_names

import 'dart:convert';
import 'dart:developer';

import 'package:dvm/app/screens/dashbourd.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewsController {
  newsFeed(String number) async {
    if (number.isNotEmpty) {
      const url = "https://darjisamajbayad.com/api/posts";
      // ignore: unused_label
      headers:
      <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode({"page": "1", "limit": "2"}),
      );

      /// open the emulator
      var resData = jsonDecode(response.body);

      if (response.statusCode == 200) {
      } else {
        const Text("Invalid Creditial");

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("login", "token");

        await prefs.setString(
          "login",
          resData['token'],
        );
        pageRoute(resData['token']);
      }

      log(resData.toString());

      return resData;
    } else {
      const Text("Bliend Velue");
    }
  }

  void pageRoute(String token) async {
    BuildContext? context;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("login", "token");
    Navigator.push(
      context!,
      MaterialPageRoute(
        builder: (context) => const Dashbourd(),
      ),
    );
  }
}
