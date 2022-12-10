// ignore_for_file: must_be_immutable, equal_keys_in_map, unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/colors.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({
    super.key,
    this.onTap,
  });

  void Function()? onTap;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  static const platform = MethodChannel("razorpay_flutter");
  late Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: const EdgeInsets.fromLTRB(4, 10, 4, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Card(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 170.0,
              color: AppColors.Cardcolor,
              child: const Center(
                child: Icon(
                  Icons.nat_rounded,
                  //Icons.nat_rounded,
                  size: 86.0,
                  color: AppColors.ContainerIconcenter,
                ),
              ),
            ),
            const SizedBox(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 40, 0),
              child: Text(
                // "Card is a widget that is used to create a rectangular area with four rounded corners ",
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
                style: GoogleFonts.roboto(
                  color: AppColors.MoneyColor,
                  fontSize: 14.0,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Alert Dialog Box"),
                          content: const Text(
                              "Are u want to go for payment gateway mode"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                //   color: Colors.green,
                                padding: const EdgeInsets.all(14),
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
                                padding: const EdgeInsets.all(14),
                                child: const Text("No"),
                              ),
                            ),
                          ],
                        ),
                      );

                      // show dialog close
                    },
                    child: Text(
                      "PAY NOW",
                      style: GoogleFonts.roboto(
                          color: AppColors.BackgroundColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite,
                  color: AppColors.AppMidleIconColor,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                const Icon(
                  Icons.notifications,
                  color: AppColors.AppMidleIconColor,
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
            ),
            const SizedBox(
              height: 14.0,
            ),
          ],
        ),
      ),
    );
  }

  //

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
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

  //
}
