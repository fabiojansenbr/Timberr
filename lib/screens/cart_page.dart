import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/screens/check_out_page.dart';
import 'package:timberr/widgets/cart_list_tile.dart';
import 'package:timberr/widgets/custom_elevated_button.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final CartController _controller = Get.find();
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
          "MY CART",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Obx(() {
        if (_controller.cartList.isEmpty) {
          return const Center(child: Text("No Item present in the cart"));
        }
        return Column(children: [
          Expanded(
            child: ListView.separated(
              itemCount: _controller.cartList.length,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CartListTile(
                  cartItem: _controller.cartList.elementAt(index),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 12,
                  thickness: 1,
                  color: Color(0xFFF0F0F0),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  height: 45,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x258A959E),
                        offset: Offset(0, 2),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: TextField(
                    style: GoogleFonts.nunitoSans(
                        fontSize: 16, fontWeight: FontWeight.w600),
                    maxLength: 6,
                    decoration: InputDecoration(
                      counter: const Offstage(),
                      contentPadding: const EdgeInsets.only(left: 20, top: 25),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x128A959E),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0x128A959E),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      isDense: true,
                      suffixIcon: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF303030),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "Enter your Promo Code",
                      hintStyle: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        height: 1,
                        color: const Color(0xFF999999),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF808080),
                        ),
                      ),
                      Obx(() {
                        return Text(
                          "\$ ${_controller.total.value}.00",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF303030),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                CustomElevatedButton(
                  onTap: () {
                    Get.to(
                      () => CheckOutPage(
                        orderAmount: _controller.total.value,
                      ),
                      transition: Transition.cupertino,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                    );
                  },
                  text: 'CHECK OUT',
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ]);
      }),
    );
  }
}
