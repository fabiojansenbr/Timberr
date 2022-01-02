import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/widgets/custom_dropdown_button.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';
import 'package:timberr/widgets/custom_input_box.dart';

class AddShippingScreen extends StatelessWidget {
  AddShippingScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
          "ADD SHIPPING ADDRESS",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        reverse: true,
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomInputBox(
                headerText: "Full name",
                hintText: "Ex: Aditya R",
                textInputType: TextInputType.name,
                onChanged: (val) {
                  print(val);
                },
              ),
              CustomInputBox(
                headerText: "Address",
                hintText: "Ex: 87 Church Street",
                textInputType: TextInputType.streetAddress,
                onChanged: (val) {
                  print(val);
                },
              ),
              CustomInputBox(
                headerText: "Zipcode (Postal Code)",
                hintText: "Ex: 600014",
                textInputAction: TextInputAction.done,
                onChanged: (val) {
                  print(val);
                },
              ),
              CustomDropdownButton(
                headerText: "Country",
                hintText: "Select Country",
                items: const [
                  DropdownMenuItem(
                    child: Text("India"),
                    value: "India",
                  )
                ],
                onChanged: (val) {
                  print(val);
                },
              ),
              CustomDropdownButton(
                headerText: "City",
                hintText: "Select City",
                items: const [
                  DropdownMenuItem(
                    child: Text("Chennai"),
                    value: "Chennai",
                  )
                ],
                onChanged: (val) {},
              ),
              CustomDropdownButton(
                headerText: "District",
                hintText: "Select District",
                items: const [
                  DropdownMenuItem(
                    child: Text("Mylapore"),
                    value: "Mylapore",
                  )
                ],
                onChanged: (val) {},
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(onTap: () {}, text: "SAVE ADDRESS"),
            ],
          ),
        ),
      ),
    );
  }
}
