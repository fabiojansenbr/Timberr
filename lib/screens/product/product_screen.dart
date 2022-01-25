import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/product_page_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/product/product_review_screen.dart';
import 'package:timberr/widgets/animation/fade_in_widget.dart';
import 'package:timberr/widgets/buttons/custom_elevated_button.dart';
import 'package:timberr/widgets/tabbed/color_selection_column.dart';
import 'package:timberr/widgets/tabbed/product_image_view.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  final _controller = Get.put(ProductPageController());
  final FavoritesController _favoriteController = Get.find();
  final CartController _cartController = Get.find();
  ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                ProductImageView(imagesList: product.imagesList),
                Positioned(
                  left: 27,
                  top: size.height * 0.05,
                  child: FadeInWidget(
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: kOffBlack,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: size.height * 0.15,
                  child: FadeInWidget(
                    child: ColorSelectionColumn(
                      colorsList: product.colorsList,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.gelasio(
                    fontSize: 24,
                    color: kOffBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: kOffBlack),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_controller.quantityCounter.value > 25) return;
                            _controller.quantityCounter.value++;
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
                        Obx(() {
                          return Text(
                            '${(_controller.quantityCounter.value < 10) ? '0' : ''}${_controller.quantityCounter.value}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kOffBlack,
                            ),
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            if (_controller.quantityCounter.value == 1) return;
                            _controller.quantityCounter.value--;
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const ProductReviewScreen());
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/star_icon.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kOffBlack,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          '(50 reviews)',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  product.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: kGraniteGrey,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      bool _isFavorite = false;
                      int i = 0;
                      for (i = 0;
                          i < _favoriteController.favoritesList.length;
                          i++) {
                        if (product.productId ==
                            _favoriteController.favoritesList
                                .elementAt(i)
                                .productId) {
                          _isFavorite = true;
                          break;
                        }
                      }
                      return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onTap: () {
                          if (_isFavorite) {
                            _favoriteController.removeProductAt(i);
                          } else {
                            _favoriteController.addProduct(product);
                          }
                        },
                        child: Ink(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: kChristmasSilver,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset(
                            (_isFavorite)
                                ? 'assets/icons/favorite_selected_icon.svg'
                                : 'assets/icons/favorite_icon.svg',
                            height: 24,
                            width: 24,
                            fit: BoxFit.scaleDown,
                            color: kOffBlack,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomElevatedButton(
                        onTap: () {
                          _cartController.addToCart(product,
                              product.colorsList[_controller.colorIndex.value],
                              quantity: _controller.quantityCounter.value);
                        },
                        text: "Add to cart",
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
