import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/address_controller.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/controllers/user_controller.dart';
import 'package:timberr/screens/profile/my_reviews_screen.dart';
import 'package:timberr/screens/profile/orders_screen.dart';
import 'package:timberr/screens/profile/payment_methods_screen.dart';
import 'package:timberr/screens/profile/settings_screen.dart';
import 'package:timberr/screens/profile/shipping_address_screen.dart';
import 'package:timberr/widgets/tabbed/bottom_navbar.dart';
import 'package:timberr/widgets/tiles/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final _userController = Get.put(UserController());
  final _cardDetailsController = Get.put(CardDetailsController());
  void _toSettingsScreen() {
    Get.to(
      () => const SettingsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toReviewScreen() {
    Get.to(
      () => const MyReviewsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toPaymentMethodsScreen() {
    Get.to(
      () => PaymentMethodsScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toShippingAddressScreen() {
    Get.to(
      () => const ShippingAddressScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void _toOrdersScreen() {
    Get.to(
      () => const OrdersScreen(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/search_icon.svg",
            color: kGraniteGrey,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "PROFILE",
          style: kMerriweatherBold16,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _userController.signOut();
            },
            icon: SvgPicture.asset(
              "assets/icons/logout_icon.svg",
              color: kGraniteGrey,
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
                  GestureDetector(
                    onTap: () {
                      _controller.uploadProfilePicture();
                    },
                    child: Container(
                      width: 80,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      clipBehavior: Clip.antiAlias,
                      child: (_controller.profilePictureUrl == null)
                          ? Image.asset("assets/default_avatar.png")
                          : FadeInImage.assetNetwork(
                              placeholder: "assets/default_avatar.png",
                              image: _controller.profilePictureUrl!,
                            ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _controller.name,
                        style: kNunitoSansBold20,
                      ),
                      Text(
                        _controller.email,
                        style: kNunitoSans14.copyWith(
                          color: kGrey,
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
              onTap: _toOrdersScreen,
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
                  onTap: _toShippingAddressScreen,
                );
              },
            ),
            const Spacer(),
            Obx(() {
              return ProfileTile(
                name: "Payment Method",
                description:
                    "You have ${_cardDetailsController.cardDetailList.length} cards",
                onTap: _toPaymentMethodsScreen,
              );
            }),
            const Spacer(),
            ProfileTile(
              name: "My Reviews",
              description: "Reviews for 5 items",
              onTap: _toReviewScreen,
            ),
            const Spacer(),
            ProfileTile(
              name: "Setting",
              description: "Notification, Password, FAQ, Contact",
              onTap: _toSettingsScreen,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
