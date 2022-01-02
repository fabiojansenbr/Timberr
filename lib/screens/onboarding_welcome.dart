import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/screens/login_screen.dart';

class OnBoardingWelcomeScreen extends StatelessWidget {
  const OnBoardingWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/onBoarding.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MAKE YOUR',
                  style: GoogleFonts.gelasio(
                    color: const Color(0xFF606060),
                    fontSize: 24,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'HOME BEAUTIFUL',
                  style: GoogleFonts.gelasio(
                    color: const Color(0xFF303030),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 25),
                  child: Text(
                    "The best simple place where you discover most wonderful furniture's and make your home beautiful",
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xFF808080),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Container(
              height: 55,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const LoginPage());
                },
                child: Text(
                  'Get Started',
                  style: GoogleFonts.gelasio(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF212121),
                  elevation: 4,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
