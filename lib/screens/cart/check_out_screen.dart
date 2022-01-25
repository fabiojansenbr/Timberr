import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/screens/cart/order_success_screen.dart';
import 'package:timberr/screens/profile/payment_methods_screen.dart';
import 'package:timberr/screens/profile/shipping_address_screen.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';
import 'package:timberr/widgets/cards/address_card.dart';

class CheckOutScreen extends StatelessWidget {
  final int orderAmount;
  CheckOutScreen({Key? key, required this.orderAmount}) : super(key: key);
  final _cardDetailController = Get.put(CardDetailsController());
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
          "CHECK-OUT",
          style: kMerriweatherBold,
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
                    color: kTinGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => const ShippingAddressScreen(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
                ),
              ],
            ),
            GetBuilder<AddressController>(
              init: AddressController(),
              builder: (_addressController) {
                if (_addressController.hasFetched) {
                  if (_addressController.addressList.isNotEmpty) {
                    return AddressCard(
                      isEditable: false,
                      address: _addressController
                          .addressList[_addressController.selectedIndex],
                      index: _addressController.selectedIndex,
                    );
                  } else {
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
                } else {
                  return const AddressCard(
                    isEditable: false,
                    index: 0,
                  );
                }
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: kTinGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(
                      () => PaymentMethodsScreen(),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                    );
                  },
                  icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
                ),
              ],
            ),
            Obx(() {
              String lastFourDigits = "XXXX";
              if (_cardDetailController.cardDetailList.isNotEmpty &&
                  _cardDetailController.hasFetched) {
                lastFourDigits = _cardDetailController.cardDetailList
                    .elementAt(_cardDetailController.selectedIndex.value)
                    .cardNumber
                    .toString()
                    .substring(12);
              }
              return Container(
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
                      "**** **** **** $lastFourDigits",
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kRaisinBlack,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery method",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    color: kTinGrey,
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
                      color: kOffBlack,
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
                          color: kTinGrey,
                        ),
                      ),
                      Text(
                        "\$ $orderAmount.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kOffBlack,
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
                          color: kTinGrey,
                        ),
                      ),
                      Text(
                        "\$ 5.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kOffBlack,
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
                          color: kTinGrey,
                        ),
                      ),
                      Text(
                        "\$ ${orderAmount + 5}.00",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kOffBlack,
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
                Get.to(
                  () => const OrderSuccessScreen(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
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
