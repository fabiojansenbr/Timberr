import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/models/cart_item.dart';
import 'package:timberr/screens/product/product_screen.dart';

class CartListTile extends StatelessWidget {
  final CartItem cartItem;
  final CartController _controller = Get.find();
  CartListTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Get.to(
                () => ProductScreen(product: cartItem.getProduct()),
                duration: const Duration(milliseconds: 500),
                transition: Transition.fadeIn,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: cartItem.color, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Hero(
                tag: cartItem.imagesList[0],
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    cacheKey: cartItem.imagesList[0],
                    imageUrl: cartItem.imagesList[0],
                    placeholder: (context, url) {
                      return Image.asset(
                        'assets/furniture_loading.gif',
                        height: 500,
                        width: 500,
                        fit: BoxFit.cover,
                      );
                    },
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.name,
                      style: GoogleFonts.nunitoSans(
                        color: kGraniteGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await _controller.removeFromCart(cartItem);
                      },
                      customBorder: const CircleBorder(),
                      child: const Icon(
                        Icons.highlight_off,
                        size: 20,
                        color: kNoghreiSilver,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.incrementQuantity(cartItem);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                          color: kChristmasSilver,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: kTinGrey,
                        ),
                      ),
                    ),
                    GetBuilder<CartController>(builder: (controller) {
                      return Text(
                        "${cartItem.quantity}",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kOffBlack,
                        ),
                      );
                    }),
                    GestureDetector(
                      onTap: () {
                        _controller.decrementQuantity(cartItem);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          color: kChristmasSilver,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: kTinGrey,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '\$ ${cartItem.price}',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kOffBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
