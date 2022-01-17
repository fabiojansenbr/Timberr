import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/controllers/user_controller.dart';
import 'package:timberr/screens/my_reviews_screen.dart';
import 'package:timberr/screens/orders_screen.dart';
import 'package:timberr/screens/payment_methods_screen.dart';
import 'package:timberr/screens/settings_screen.dart';
import 'package:timberr/screens/shipping_address_screen.dart';
import 'package:timberr/widgets/bottom_navbar.dart';
import 'package:timberr/widgets/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final _userController = Get.put(UserController());
  final _cardDetailsController = Get.put(CardDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search_icon.svg",
            color: const Color(0xFF606060),
          ),
        ),
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: GoogleFonts.merriweather(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF303030),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _userController.signOut();
            },
            icon: SvgPicture.asset(
              "assets/icons/logout_icon.svg",
              color: const Color(0xFF606060),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedPos: 3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            GetBuilder<UserController>(builder: (_controller) {
              return Row(
                children: [
                  Container(
                    width: 80,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://avatars.githubusercontent.com/u/62930521?v=4",
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.name,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF303030),
                        ),
                      ),
                      Text(
                        _controller.email,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }),
            const Spacer(flex: 2),
            ProfileTile(
              name: "My Orders",
              description: "Already have 10 orders",
              onTap: () {
                Get.to(
                  () => const OrdersScreen(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                );
              },
            ),
            const Spacer(),
            GetBuilder<AddressController>(
                init: AddressController(),
                builder: (_addressController) {
                  String addressCount =
                      _addressController.addressList.length.toString();
                  if (addressCount != '0' && addressCount.length == 1) {
                    addressCount = '0' + addressCount;
                  }
                  return ProfileTile(
                    name: "Shipping Addresses",
                    description: "$addressCount Addresses",
                    onTap: () {
                      Get.to(
                        () => const ShippingAddressScreen(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                  );
                }),
            const Spacer(),
            Obx(() {
              return ProfileTile(
                name: "Payment Method",
                description:
                    "You have ${_cardDetailsController.cardDetailList.length} cards",
                onTap: () {
                  Get.to(
                    () => PaymentMethodsScreen(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeOut,
                  );
                },
              );
            }),
            const Spacer(),
            ProfileTile(
              name: "My Reviews",
              description: "Reviews for 5 items",
              onTap: () {
                Get.to(
                  () => const MyReviewsScreen(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                );
              },
            ),
            const Spacer(),
            ProfileTile(
              name: "Setting",
              description: "Notification, Password, FAQ, Contact",
              onTap: () {
                Get.to(
                  () => const SettingsScreen(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                );
              },
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
