import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/widgets/custom_dropdown_button.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';
import 'package:timberr/widgets/custom_input_box.dart';

class AddShippingScreen extends StatelessWidget {
  AddShippingScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final AddressController _addressController = Get.find();

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
                  _addressController.name = val;
                },
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
              ),
              CustomInputBox(
                headerText: "Address",
                hintText: "Ex: 87 Church Street",
                textInputType: TextInputType.streetAddress,
                onChanged: (val) {
                  _addressController.address = val;
                },
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter the address";
                  } else {
                    return null;
                  }
                },
              ),
              CustomInputBox(
                headerText: "Zipcode (Postal Code)",
                hintText: "Ex: 600014",
                maxLength: 6,
                textInputAction: TextInputAction.done,
                onChanged: (val) {
                  _addressController.pincode = int.parse(val);
                },
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter your pincode";
                  } else if (!val!.isNum) {
                    return "Please enter a valid pincode";
                  } else if (val.length != 6) {
                    return "Pincode must be 6 characters long";
                  } else {
                    return null;
                  }
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
                  _addressController.country = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select your Country" : null;
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
                onChanged: (val) {
                  _addressController.city = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select the City" : null;
                },
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
                onChanged: (val) {
                  _addressController.district = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select the District" : null;
                },
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _addressController.uploadAddress();
                  }
                },
                text: "SAVE ADDRESS",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
