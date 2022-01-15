import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/models/address.dart';
import 'package:timberr/widgets/custom_dropdown_button.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';
import 'package:timberr/widgets/custom_input_box.dart';

class EditShippingScreen extends StatelessWidget {
  final Address initialAddress;
  final int index;
  late String name, address, country, city, district;
  late int pincode;
  EditShippingScreen(
      {Key? key, required this.initialAddress, required this.index})
      : super(key: key) {
    name = initialAddress.name;
    address = initialAddress.address;
    pincode = initialAddress.pincode;
    country = initialAddress.country;
    city = initialAddress.city;
    district = initialAddress.district;
  }
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
          "EDIT SHIPPING ADDRESS",
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
                initialValue: initialAddress.name,
                onChanged: (val) {
                  name = val;
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
                  address = val;
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
                  pincode = int.parse(val);
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
              CustomDropdownButton(
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
                  country = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select your Country" : null;
                },
              ),
              CustomDropdownButton(
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
                  city = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select the City" : null;
                },
              ),
              CustomDropdownButton(
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
                  district = val;
                },
                validator: (val) {
                  return (val == null) ? "Please Select the District" : null;
                },
              ),
              const SizedBox(height: 24),
              CustomElevatedButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _addressController.editAddress(
                      index,
                      Address(
                          id: initialAddress.id,
                          name: name,
                          address: address,
                          pincode: pincode,
                          country: country,
                          city: city,
                          district: district),
                    );
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
                      color: const Color(0xFFEB5757),
                      letterSpacing: 1.5,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF303030),
                    side: const BorderSide(color: Color(0xFFEB5757)),
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
