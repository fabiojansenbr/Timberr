import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/screens/home.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                Text(
                  "SUCCESS!",
                  style: kMerriweatherBold.copyWith(
                    fontSize: 36,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(
                  height: 280,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset("assets/order_success.svg", height: 230),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: kCrayolaGreen,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  "Your order will be delivered soon.\nThank you for choosing our app!",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: kGraniteGrey,
                  ),
                ),
                const Spacer(),
                CustomElevatedButton(onTap: () {}, text: "TRACK YOUR ORDERS"),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Get.offAll(
                        () => Home(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Text(
                      "BACK TO HOME",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kOffBlack,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      primary: kOffBlack,
                      side: const BorderSide(color: kOffBlack),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}