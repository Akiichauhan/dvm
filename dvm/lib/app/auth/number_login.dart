// ignore_for_file: avoid_print, depend_on_referenced_packages, unused_import, unused_element, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:developer';

import 'package:dvm/app/api/auth_controller.dart';
import 'package:dvm/app/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;

import '../model/member_found.dart';
import '../utils/ui_progress_indicator.dart';
import '../widget/Icon_text_input.dart';
import 'package:http/http.dart' as http;

import 'verify_otp.dart';

class SignWithNumber extends StatefulWidget {
  const SignWithNumber({super.key});

  @override
  State<SignWithNumber> createState() => _SignWithNumberState();
}

class _SignWithNumberState extends State<SignWithNumber>
    with SingleTickerProviderStateMixin {
  TextEditingController phoneController = TextEditingController();
  // AuthController authController = AuthController();
  // TextEditingController countryCode = TextEditingController();

  bool isLoding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // countryCode.text = "+91";
  }

  // https://www.youtube.com/watch?v=aHnrUXqiWYE&t=83s
  // token explain

  void sendOTP() async {
    String phone = "+91${phoneController.text.trim()}";
    //log(phone);
    print(phone);
    // aaya thi 91 print thay che

    setState(() {
      isLoding = true;
    });
    //log(phone.toString());
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          // log(verificationId); //check that id is not null here and after passsing value check
          setState(() {
            isLoding = false;
          });

          nameShow();

          Navigator.popUntil(context, (route) => route.isFirst);

          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(
              // 2 miniuy

              //

              builder: (context) => OTPScreen(verificationId: verificationId),
            ),
          );
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
  }

  void nameShow() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("number", phoneController.text);
    log(phoneController.text.toString());
  }

  memberIsAvailble(String phone) async {
    print(" my Member is Found:-   $phone");

    var data = await http.post(
      Uri.parse('https://darjisamajbayad.com/api/checkmember'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <dynamic, String>{
          'mobile_no': phone,
        },
      ),
    );

    var json = jsonDecode(data.body);
    log(json.toString());

    memberFound member = memberFound.fromJson(json);

    print(member.messages!.success);
  }

  //
  //vhttps://www.youtube.com/watch?v=VPpSvgpxaQo&t=22s
//

  void showDialog(
      {required AlertDialog Function(dynamic ctx) builder,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Dialog Title'),
              content: Text('This member is availbe $phoneController'),
            ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PrimaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color(0xffFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "User your mobile to get started",
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            //label color  #E5E5E5
                            // go color #BB1918
                          ),
                        ),
                        const SizedBox(
                          height: 14.0,
                        ),
                        Container(
                          height: 56.0,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.red),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                width: 22.0,
                                child: TextFormField(
                                  readOnly: true,
                                  // controller: countryCode,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: "+91"),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "|",
                                style: GoogleFonts.roboto(
                                  fontSize: 34.0,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(
                                width: 14.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Enter Mobile Number"),
                                ),
                              ),
                              Consumer<AuthC>(
                                builder: (context, value, child) => InkWell(
                                    onTap: () {
                                      memberIsAvailble(phoneController.text);

                                      value.login(phoneController.text);
                                      //  authController.login(countryCode.text);

                                      sendOTP();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 20, 6),
                                      child: Text(
                                        "Go",
                                        style: GoogleFonts.roboto(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        //
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (isLoding)
            const UiProgressIndicator(
              message: "Phone Number is Verify...",
            ),
        ],
      ),
    );
  }
}

/*
            SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "User your mobile to get started",
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            //label color  #E5E5E5
                            // go color #BB1918
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        IconInputText(
                          keyboardType: TextInputType.number,
                          suffixIcon: InkWell(
                            onTap: () {
                              //
                              // and bro when i am login from diffrent users it give me unique token not a same token

                              memberIsAvailble(phoneController.text);
                              authController.login(phoneController.text);
                              // i am showing here number login

                              sendOTP();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Text(
                                "Go",
                                style: GoogleFonts.roboto(
                                    color: AppColors.PrimaryColor,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          obscureText: false,
                          labelText: "Enter Mobile Number",
                          controller: phoneController,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 18, 8, 18),
                            child: Text(
                              "+91",
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
      

* */
