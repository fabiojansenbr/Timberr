import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/card_details_controller.dart';
import 'package:timberr/screens/add_payment_method.dart';
import 'package:timberr/widgets/payment_card_view.dart';

class PaymentMethodsScreen extends StatelessWidget {
  PaymentMethodsScreen({Key? key}) : super(key: key);
  final CardDetailsController _cardDetailsController = Get.find();
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
          "PAYMENT METHOD",
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
            () => AddPaymentMethod(),
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
      body: Obx(() {
        if (_cardDetailsController.cardDetailList.isEmpty &&
            _cardDetailsController.hasFetched) {
          return Center(
            child: Text(
              "No Payment Details have been added",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                color: const Color(0xFF808080),
              ),
            ),
          );
        }
        return ListView.builder(
          itemCount: _cardDetailsController.cardDetailList.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          itemBuilder: (context, index) {
            return Obx(() {
              return Column(
                children: [
                  PaymentCardView(
                    cardHolderName: _cardDetailsController.cardDetailList
                        .elementAt(index)
                        .name,
                    lastFourDigits: _cardDetailsController.cardDetailList
                        .elementAt(index)
                        .cardNumber
                        .toString()
                        .substring(12),
                    expiryDateString:
                        "${_cardDetailsController.cardDetailList.elementAt(index).month}/${_cardDetailsController.cardDetailList.elementAt(index).year}",
                    isMasterCard: index % 2 == 0,
                    isSelected:
                        _cardDetailsController.selectedIndex.value == index,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                        child: Checkbox(
                          value: (_cardDetailsController.selectedIndex.value ==
                                  index)
                              ? true
                              : false,
                          onChanged: (isSelected) {
                            _cardDetailsController.setDefaultCardDetail(index);
                          },
                          activeColor: const Color(0xFF303030),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          splashRadius: 20,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      Text(
                        "Use as default payment method",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: const Color(0xFF222222),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              );
            });
          },
        );
      }),
    );
  }
}
