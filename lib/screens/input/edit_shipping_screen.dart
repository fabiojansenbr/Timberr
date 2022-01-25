import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/models/address.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';
import 'package:timberr/widgets/input/custom_dropdown_box.dart';
import 'package:timberr/widgets/input/custom_input_box.dart';

class EditShippingScreen extends StatelessWidget {
  final Address initialAddress;
  final int index;
  final _formKey = GlobalKey<FormState>();
  final AddressController _addressController = Get.find();

  EditShippingScreen(
      {Key? key, required this.initialAddress, required this.index})
      : super(key: key) {
    _addressController.name = initialAddress.name;
    _addressController.address = initialAddress.address;
    _addressController.pincode = initialAddress.pincode;
    _addressController.country = initialAddress.country;
    _addressController.city = initialAddress.city;
    _addressController.district = initialAddress.district;
  }

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
            color: kOffBlack,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "EDIT SHIPPING ADDRESS",
          style: kMerriweatherBold,
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
                initialValue: initialAddress.name,
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
                initialValue: initialAddress.address,
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
                textInputAction: TextInputAction.done,
                initialValue: initialAddress.pincode.toString(),
                onChanged: (val) {
                  _addressController.pincode = int.parse(val);
                },
                validator: (val) {
                  if (val?.isEmpty ?? true) {
                    return "Please enter your pincode";
                  } else if (!val!.isNum) {
                    return "Please enter a valid pincode";
                  } else {
                    return null;
                  }
                },
              ),
              CustomDropdownBox(
                headerText: "Country",
                hintText: "Select Country",
                initialValue: initialAddress.country,
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
              CustomDropdownBox(
                headerText: "City",
                hintText: "Select City",
                initialValue: initialAddress.city,
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
              CustomDropdownBox(
                headerText: "District",
                hintText: "Select District",
                initialValue: initialAddress.district,
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
                    _addressController.editAddress(index, initialAddress.id);
                  }
                },
                text: "EDIT ADDRESS",
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    _addressController.deleteAddress(index);
                  },
                  child: Text(
                    "DELETE",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kFireOpal,
                      letterSpacing: 1.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: kOffBlack,
                    side: const BorderSide(color: kFireOpal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
