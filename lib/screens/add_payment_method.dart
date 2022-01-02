import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';
import 'package:timberr/widgets/custom_input_box.dart';
import 'package:timberr/widgets/payment_card_view.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

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
          "ADD PAYMENT METHOD",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            const PaymentCardView(),
            const SizedBox(height: 30),
            CustomInputBox(
              headerText: "CardholderName",
              hintText: "Ex: Aditya R",
              textInputType: TextInputType.name,
              onChanged: (val) {
                print(val);
              },
            ),
            CustomInputBox(
              headerText: "Card Number",
              hintText: "Ex: XXXX XXXX XXXX 3456",
              onChanged: (val) {
                print(val);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: CustomInputBox(
                    headerText: "CVV",
                    hintText: "Ex: 123",
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: CustomInputBox(
                    headerText: "Expiration Date",
                    hintText: "Ex: 22/04",
                    textInputAction: TextInputAction.done,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomElevatedButton(onTap: () {}, text: "ADD NEW CARD"),
          ],
        ),
      ),
    );
  }
}
