import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/screens/order_success_screen.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';

class CheckOutPage extends StatelessWidget {
  final int orderAmount;
  const CheckOutPage({Key? key, required this.orderAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF303030),
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "CHECK-OUT",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Address",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: const Color(0xFF909090),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
                ),
              ],
            ),
            Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x408A959E),
                    offset: Offset(0, 8),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text(
                      "Aditya R",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF303030),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Color(0xFFF0F0F0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      "87 Town square apts, Luz corner road, Mylapore, Chennai, 600004",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        color: const Color(0xFF808080),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: const Color(0xFF909090),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
                ),
              ],
            ),
            Container(
              height: 69,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x408A959E),
                    offset: Offset(0, 8),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 38,
                    width: 64,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x20000000),
                          offset: Offset(0, 1),
                          blurRadius: 25,
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/mastercard_bw.svg',
                      height: 25,
                      width: 32,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Text(
                    "**** **** **** 3947",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF222222),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery method",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: const Color(0xFF909090),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
                ),
              ],
            ),
            Container(
              height: 54,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x408A959E),
                    offset: Offset(0, 8),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Image.asset("assets/dhl.png"),
                  const SizedBox(width: 15),
                  Text(
                    "Fast (2-3 days)",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            Container(
              height: 135,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x408A959E),
                    offset: Offset(0, 8),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order:",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          color: const Color(0xFF909090),
                        ),
                      ),
                      Text(
                        "\$ ${orderAmount}.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF303030),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery:",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          color: const Color(0xFF909090),
                        ),
                      ),
                      Text(
                        "\$ 5.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF303030),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total:",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          color: const Color(0xFF909090),
                        ),
                      ),
                      Text(
                        "\$ ${orderAmount + 5}.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF303030),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CustomElevatedButton(
              onTap: () {
                Get.off(
                  () => const OrderSuccessScreen(),
                  transition: Transition.zoom,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn,
                );
              },
              text: 'Submit Order',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
