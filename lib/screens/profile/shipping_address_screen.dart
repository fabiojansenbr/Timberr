import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/screens/input/add_shipping_screen.dart';
import 'package:timberr/widgets/cards/address_card.dart';

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
            color: kOffBlack,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "SHIPPING ADDRESS",
          style: kMerriweatherBold,
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
        foregroundColor: kOffBlack,
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
                color: kGrey,
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
                        activeColor: kOffBlack,
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
                        color: kGrey,
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