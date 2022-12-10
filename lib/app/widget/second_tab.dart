// ignore_for_file: must_be_immutable, avoid_print, unused_field, unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:dvm/app/api/auth_controller.dart';
import '../utils/colors.dart';
import 'custom_btn.dart';

class PaymentHistoryContainer extends StatefulWidget {
  const PaymentHistoryContainer({
    super.key,
  });

  @override
  State<PaymentHistoryContainer> createState() =>
      _PaymentHistoryContainerState();
}

class _PaymentHistoryContainerState extends State<PaymentHistoryContainer> {
  static const platform = MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;

  String? displayName = "";
  // AuthController authController = AuthController();

  bool? isSwitched = false;
  var textValue = 'Unpaid';
  //String number = "8780749383";
  String number = "";

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Paid';
      });
      print('Paid');
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Unpaid';
      });
      print('Unpaid');
    }
  }

// shared preference

  String? token;
  String? name;
  void getData() async {
    log("The Dashbourd Token is Showing");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("login");
      name = prefs.getString("login");

      // aaya login()! add kryu hatu
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthC>(
      builder: (context, value, child) => FutureBuilder(
          future: value.login(number),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!['data'];
              return Container(
                color: Colors.pink,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.red,
                            elevation: 4,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),

                                    Text("Helllooo"),

                                    Text(
                                      "Your Name is ==> $name",
                                      style: GoogleFonts.roboto(
                                        color: Colors.red,
                                      ),
                                    ),

                                    /////

                                    Consumer<AuthC>(
                                      builder: (context, value, child) => Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 56,
                                                  height: 56,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(28.0),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: CircleAvatar(
                                                      radius: 18.0,
                                                      //#D9D9D9
                                                      backgroundColor: AppColors
                                                          .CircleBgColor,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 18.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      // here i am calling daytaa
                                                      // ythe code is top
                                                      //open emul;ator
                                                      Text(
                                                        data[
                                                            'name'], // i want to save here name
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 18.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),

                                                      // showName(),
                                                      const SizedBox(),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/home.png",
                                                            width: 14.0,
                                                            height: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 8.0,
                                                          ),
                                                          Text(
                                                            data['village'],
                                                            //data["residence"],
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 10.0,
                                                              color: AppColors
                                                                  .CircleBgColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/map.png",
                                                            width: 14.0,
                                                            height: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 8.0,
                                                          ),
                                                          Text(
                                                            data["live_in"],
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 10.0,
                                                              color: AppColors
                                                                  .CircleBgColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),

                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 12, 0, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "1,500",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 34.0,
                                        // ),
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "1300",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "200",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "History",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0,
                                    color: AppColors.blackcolor,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    textValue,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched!,
                                    activeColor: AppColors.BackgroundColor,
                                    activeTrackColor: const Color(0xffE5D3FC),
                                    inactiveThumbColor: Colors.redAccent,
                                    inactiveTrackColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Party full name",
                                      style:
                                          //          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                                          GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color:
                                            const Color.fromARGB(255, 3, 3, 3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\u{20B9}' "100",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          "Date: 19th august, 2022",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.TextColor,

                                            // fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60.0),
                                          child: Text(
                                            "Bayad, gujrat",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.TextColor,

                                              // fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      width: 90.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Are u want to go for payment gateway mode"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    //   color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: InkWell(
                                                      onTap: () {
                                                        log("r u click the openCheckOut Method");
                                                        Navigator.of(ctx).pop();

                                                        openCheckout();
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    // color: Colors.red,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          // show dialog close
                                        },
                                        child: UIButton(
                                          color: AppColors.BackgroundColor,
                                          labelText: "PAY NOW",
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 2.0,
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                //
                                //
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          //
                          Card(
                            color: AppColors.BackgroundColor,
                            elevation: 4,
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      " s==> $token",
                                      style: GoogleFonts.roboto(
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Consumer<AuthC>(
                                      builder: (context, myType, child) =>
                                          FutureBuilder(
                                              future: myType.login(number),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  if (snapshot.data != null) {
                                                    return Text(snapshot
                                                            .data!['data'][
                                                        'id']); /* ListView.builder(
                                                  itemBuilder: (context, index) {
                                                final data =
                                                    snapshot.data![index];
                                                final heads = data['data'];
                                                
                                              }); */
                                                  } else {
                                                    return const CircularProgressIndicator();
                                                  }
                                                } else {
                                                  return const Text(' no data');
                                                }
                                              }),
                                    ),

                                    /////

                                    Consumer<AuthC>(
                                      builder: (context, value, child) => Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 56,
                                                  height: 56,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(28.0),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    child: CircleAvatar(
                                                      radius: 18.0,
                                                      //#D9D9D9
                                                      backgroundColor: AppColors
                                                          .CircleBgColor,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 18.0,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 12.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "vfg", // i want to save here name
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 20.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      showName(),
                                                      const SizedBox(),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/home.png",
                                                            width: 14.0,
                                                            height: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 8.0,
                                                          ),
                                                          Text(
                                                            "Residence",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 10.0,
                                                              color: AppColors
                                                                  .CircleBgColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Image.asset(
                                                            "images/map.png",
                                                            width: 14.0,
                                                            height: 14.0,
                                                            color: Colors.white,
                                                          ),
                                                          const SizedBox(
                                                            width: 8.0,
                                                          ),
                                                          Text(
                                                            "LiveIn",
                                                            style: GoogleFonts
                                                                .roboto(
                                                              fontSize: 10.0,
                                                              color: AppColors
                                                                  .CircleBgColor,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),

                                Container(
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(14, 12, 0, 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "1,500",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(
                                        //   width: 34.0,
                                        // ),
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "1300",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "ACTUAL",
                                              style: GoogleFonts.roboto(
                                                  fontSize: 10.0,
                                                  color: AppColors.blackcolor,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 2.0),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '\u{20B9}',
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 16.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  "200",
                                                  style: GoogleFonts.roboto(
                                                    fontSize: 18.0,
                                                    color: AppColors.blackcolor,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "History",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.0,
                                    color: AppColors.blackcolor,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  Text(
                                    textValue,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Switch(
                                    onChanged: toggleSwitch,
                                    value: isSwitched!,
                                    activeColor: AppColors.BackgroundColor,
                                    activeTrackColor: const Color(0xffE5D3FC),
                                    inactiveThumbColor: Colors.redAccent,
                                    inactiveTrackColor: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 6.0,
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Party full name",
                                      style:
                                          //          TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                                          GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color:
                                            const Color.fromARGB(255, 3, 3, 3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\u{20B9}' "100",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                const SizedBox(
                                  height: 2.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          "Date: 19th august, 2022",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.TextColor,

                                            // fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60.0),
                                          child: Text(
                                            "Bayad, gujrat",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.TextColor,

                                              // fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      width: 90.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Are u want to go for payment gateway mode"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    //   color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: InkWell(
                                                      onTap: () {
                                                        log("r u click the openCheckOut Method");
                                                        Navigator.of(ctx).pop();

                                                        openCheckout();
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    // color: Colors.red,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          // show dialog close
                                        },
                                        child: UIButton(
                                          color: AppColors.BackgroundColor,
                                          labelText: "PAY NOW",
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 2.0,
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                //
                                //
                              ],
                            ),
                          ),
                          // second
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " Party full name",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color:
                                            const Color.fromARGB(255, 3, 3, 3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\u{20B9}' "100",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                const SizedBox(
                                  height: 2.0,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          "Date: 19th august, 2022",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.TextColor,

                                            // fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60.0),
                                          child: Text(
                                            "Gabat, gujrat",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.TextColor,

                                              // fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      width: 90.0,
                                      child: GestureDetector(
                                        //
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Are u want to go for payment gateway mode"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    //   color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: InkWell(
                                                      onTap: () {
                                                        log("r u click the openCheckOut Method");
                                                        Navigator.of(ctx).pop();

                                                        openCheckout();
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    // color: Colors.red,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          // show dialog close
                                        },

                                        //
                                        child: UIButton(
                                          color: AppColors.BackgroundColor,
                                          labelText: "PAY NOW",
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 2.0,
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                //
                                //
                              ],
                            ),
                          ),
                          // third

                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Party full name",
                                      style:
                                          //        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                                          GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color:
                                            const Color.fromARGB(255, 3, 3, 3),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text(
                                        '\u{20B9}' "100",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                const SizedBox(
                                  height: 2.0,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          "Date: 19th august, 2022",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.TextColor,

                                            // fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60.0),
                                          child: Text(
                                            "Gabat, gujrat",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.TextColor,

                                              // fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      width: 90.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Are u want to go for payment gateway mode"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    //   color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: InkWell(
                                                      onTap: () {
                                                        log("r u click the openCheckOut Method");
                                                        Navigator.of(ctx).pop();

                                                        openCheckout();
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    // color: Colors.red,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          // show dialog close
                                        },
                                        child: UIButton(
                                          color: AppColors.BackgroundColor,
                                          labelText: "PAY NOW",
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 2.0,
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                //
                                //
                              ],
                            ),
                          ),
                          // fourth
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "$displayName",
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        '\u{20B9}' "100",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //
                                //
                                const SizedBox(
                                  height: 2.0,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      children: [
                                        Text(
                                          "Date: 19th august, 2022",
                                          style: GoogleFonts.roboto(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.TextColor,

                                            // fontSize: 14.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 60.0),
                                          child: Text(
                                            "Gabat, gujrat",
                                            style: GoogleFonts.roboto(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.TextColor,

                                              // fontSize: 14.0,
                                            ),
                                            //
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 6.0),
                                      width: 90.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Alert Dialog Box"),
                                              content: const Text(
                                                  "Are u want to go for payment gateway mode"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    //   color: Colors.green,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: InkWell(
                                                      onTap: () {
                                                        log("r u click the openCheckOut Method");
                                                        Navigator.of(ctx).pop();

                                                        openCheckout();
                                                      },
                                                      child: const Text("Yes"),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    // color: Colors.red,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("No"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          // show dialog close
                                        },
                                        child: UIButton(
                                          color: AppColors.BackgroundColor,
                                          labelText: "PAY NOW",
                                          style: GoogleFonts.roboto(
                                            letterSpacing: 2.0,
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                //
                                //
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }

  //
  //https://www.youtube.com/watch?v=auspHSmtVII
  getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      displayName = prefs.getString(
        "displayName",
      );
    });
  }

  showName() {
    if (displayName != null) {
      return Text(
        "$displayName is Login ",
        style: GoogleFonts.roboto(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );
    } else {
      return const Text("Welcome");
    }
  }

  @override
  void initState() {
    getName();
    getData();
    super.initState();
    // payment code
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();

    _razorpay.clear();
  }

// https://github.com/razorpay/razorpay-flutter/issues/221
  void openCheckout() async {
    var options = {
      'key': 'rzp_live_ILgsfZCZoFIKMb',
      'amount': 100,
      'name': 'ABC',
      'description': 'XYZ',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8141175356', 'email': 'trizerow@gmail.com'},
      //
      "method": {
        "netbanking": false,
        "card": false,
        "upi": true,
        "wallet": false,
        "emi": false,
        "paylater": false,
        "lastant bank transfer": false,
        "international": false,
      },
//
//
      "config": {
        "display": {
          "hide": [
            {"method": 'paylater'},
            {"method": 'emi'},
            {"method": 'netbanking'},
            {"method": 'wallet'},
            {"method": 'international'},
          ],
          // "preferences": {
          //   "show_default_blocks": true,
          // }
        }
      },
//

      //
      'external': {
        //    'wallets': ['paytm']
        //  'wallets': ['upi'],
      }
    };

    try {
      // _razorpay.open(options);
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
      // r u there
    }
  }
  //first run the app after we will check error
  // ok open ur android studio

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Success Response: $response');
    /*Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    /* Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    /* Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT); */
  }

  //

  // ignore: non_constant_identifier_names
}
