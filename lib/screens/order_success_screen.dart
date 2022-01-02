import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';
import 'package:timberr/wrapper.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                "SUCCESS!",
                style: GoogleFonts.merriweather(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF303030),
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
                          color: Color(0xFF27AE50),
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
                  color: const Color(0xFF606060),
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
                    Get.offAll(() => const Wrapper());
                  },
                  child: Text(
                    "BACK TO HOME",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF303030)),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF303030),
                    side: const BorderSide(color: Color(0xFF303030)),
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
    );
  }
}
