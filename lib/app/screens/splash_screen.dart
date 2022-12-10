// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:dvm/app/auth/number_login.dart';
import 'package:dvm/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//splash screen
//https://www.youtube.com/watch?v=jATox3OCefw

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    String? verificationId;
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: SizedBox(
            height: 300.0,
            width: 400.0,
            child: Center(
              child: Text(
                "DVM",
                //caveat
                style: GoogleFonts.righteous(
                    fontSize: 48.0,
                    letterSpacing: 12.0,
                    color: const Color.fromARGB(255, 246, 246, 246)),
              ),
            ),
          ),
        ),
        //     nextScreen: const OTPScreen(verificationId: "verificationId"),
        nextScreen: const SignWithNumber(),
        splashTransition: SplashTransition.rotationTransition,
        backgroundColor: AppColors.BackgroundColor,
        duration: 3000,
      ),
    );
  }
}
