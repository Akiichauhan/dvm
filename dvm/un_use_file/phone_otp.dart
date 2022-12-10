// ignore_for_file: use_build_context_synchronously, avoid_print, await_only_futures, unused_local_variable

import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class PhoneWithOTP extends StatefulWidget {
  final String? verificationId;
  const PhoneWithOTP({
    super.key,
    this.verificationId,
  });

  @override
  State<PhoneWithOTP> createState() => _PhoneWithOTPState();
}

//   8:55

class _PhoneWithOTPState extends State<PhoneWithOTP> {
  OtpFieldController? otpController = OtpFieldController();
  TextEditingController? textEditingController = TextEditingController();

  String? _verificationId;

// oTP send
  void sendOTP() async {
    String phone = "+91${textEditingController?.text.trim()}";
    log(phone);

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          log(verificationId);
          if (mounted) {
            setState(() {
              _verificationId = verificationId;
            });
          }
// sir ithink here wronh
          // Navigator.push(
          //   context,
          //   CupertinoPageRoute(
          //     builder: (context) => OTPScreen(
          //       verificationId: verificationId,
          //       // textEditingController: phoneController,
          //     ),
          //   ),
          // );
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          if (mounted) {
            setState(() {
              _verificationId = verificationId;
            });
          }
        },
        timeout: const Duration(seconds: 30));
  }
// Now this will work fine
// verify OTP

// sir ek ye solve ho jaye
  verifyOTP(String pinValue) async {
    //final String myotp = otpController.text.toString();
    var myotp = pinValue;
    log("My OTP is $myotp");

    PhoneAuthCredential credential = await PhoneAuthProvider.credential(
        verificationId: _verificationId.toString(), smsCode: myotp);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        /*
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
   */
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(ex.message.toString()),
          );
        },
      );
    }
  }

  int start = 30;
  bool wait = false;
  String buttonName = "Send OTP";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 110.0,
                ),
                Text(
                  "Mobile Number Verification",
                  style: GoogleFonts.inter(
                    //  style: GoogleFonts.anton(
                    fontSize: 22.0,
                    color: const Color(0xffB9B9B9),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),

                textField(),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  "Enter OTP Below",
                  style: GoogleFonts.inter(
                    fontSize: 20.0,
                    color: const Color(0xffB9B9B9),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),

                otpField(),
                const SizedBox(
                  height: 30.0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Send OTP again in ",
                        style: GoogleFonts.inter(
                            fontSize: 16.0, color: Colors.yellowAccent),
                      ),
                      TextSpan(
                        text: "00:$start",
                        style: GoogleFonts.inter(
                            fontSize: 16.0, color: Colors.pinkAccent),
                      ),
                      TextSpan(
                        text: " sec",
                        style: GoogleFonts.inter(
                            fontSize: 16.0, color: Colors.pinkAccent),
                      ),
                    ],
                  ),
                ),
                /*const SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 060,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffff9601),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      var otp = otpController.toString();
                      print("The OTP is = +$otp");
                      verifyOTP();
                    },
                    child: Center(
                      child: Text("Lets Go",
                          style: GoogleFonts.roboto(
                            fontSize: 16.0,
                            color: const Color(0xFFFbe2ae),
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                ),*/

                //   8:55
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        if (mounted) {
          setState(() {
            timer.cancel();
            wait = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            start--;
          });
        }
      }
    });
  }

  Widget otpField() {
    return OTPTextField(
        contentPadding: const EdgeInsets.all(8.0),
        controller: otpController,
        length: 6,
        width: MediaQuery.of(context).size.width * 8,
        fieldWidth: 40.0,
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        otpFieldStyle: OtpFieldStyle(
          focusBorderColor: const Color(0xff19CFBE),
          borderColor: Colors.white,
          enabledBorderColor: Colors.white,
        ),

        //   outlineBorderRadius: 15,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        onChanged: (pin) {
          print("Changed: $pin");
        },
        onCompleted: (pin) {
          print("Completed: $pin");
          verifyOTP(pin);
        });
  }

//
//
// //

  Widget textField() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color(0xff1d1d1d),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: textEditingController,
        style: GoogleFonts.inter(
          color: const Color.fromARGB(255, 244, 240, 240),
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "98765 43210",
          hintStyle: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
          prefixIcon: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
            child: Text(
              "+91",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          suffixIcon: InkWell(
            onTap: wait
                ? null
                : () {
                    sendOTP();
                    startTimer();
                    if (mounted) {
                      setState(() {
                        start = 30;
                        wait = true;
                        buttonName = "Resend OTP";
                      });
                    }
                  },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
              child: Text(
                buttonName,
                style: GoogleFonts.roboto(
                  color: wait ? const Color(0xff0996C4) : Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
