import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/screens/add_payment_method.dart';
import 'package:timberr/widgets/payment_card_view.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

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
          "PAYMENT METHOD",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => const AddPaymentMethod(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
        elevation: 8,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF303030),
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        itemBuilder: (context, index) {
          return Column(
            children: [
              PaymentCardView(
                cardHolderName: "Aditya R",
                lastFourDigits: "4691",
                expiryDateString: "04/22",
                isMasterCard: index == 0,
                isSelected: index == 0,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    child: Checkbox(
                      value: (index == 0) ? true : false,
                      onChanged: (isSelected) {},
                      activeColor: const Color(0xFF303030),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      splashRadius: 20,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text(
                    "Use as default payment method",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      color: const Color(0xFF222222),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
