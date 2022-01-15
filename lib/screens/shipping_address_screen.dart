import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/screens/add_shipping_screen.dart';
import 'package:timberr/widgets/address_card.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

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
          "SHIPPING ADDRESS",
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
            () => AddShippingScreen(),
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
      body: GetBuilder<AddressController>(builder: (_addressController) {
        if (_addressController.hasFetched &&
            _addressController.addressList.isEmpty) {
          return Center(
            child: Text(
              "No Shipping Addresses have been entered",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                color: const Color(0xFF808080),
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: _addressController.addressList.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      child: Checkbox(
                        value: (_addressController.selectedIndex == index)
                            ? true
                            : false,
                        onChanged: (isSelected) {
                          _addressController.setDefaultShippingAddress(index);
                        },
                        activeColor: const Color(0xFF303030),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        splashRadius: 20,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                    Text(
                      "Use as the shipping address",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 18,
                        color: const Color(0xFF808080),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                AddressCard(
                  address: _addressController.addressList[index],
                  index: index,
                ),
                const SizedBox(height: 30),
              ],
            );
          },
        );
      }),
    );
  }
}
