import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/models/product.dart';
import 'package:timberr/screens/product_page.dart';

class ProductGridTile extends StatelessWidget {
  final Product product;
  final CartController _cartController = Get.find();
  ProductGridTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductPage(product: product),
          duration: const Duration(milliseconds: 500),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.7,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Hero(
                    tag: product.imagesList[0],
                    child: CachedNetworkImage(
                      cacheKey: product.imagesList[0],
                      imageUrl: product.imagesList[0],
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        if (downloadProgress.progress == null) {
                          return const SizedBox();
                        } else {
                          return Image.asset(
                            'assets/furniture_loading.gif',
                            height: 500,
                            width: 500,
                            fit: BoxFit.cover,
                          );
                        }
                      },
                      height: 500,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 12,
                    bottom: 10,
                    child: GestureDetector(
                      onTap: () {
                        _cartController.addToCart(
                            product, product.colorsList[0]);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: const Color(0xFF606060).withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/shopping_bag_icon.svg',
                          height: 20,
                          width: 20,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name,
            style: const TextStyle(fontSize: 14, color: Color(0xFF606060)),
          ),
          const SizedBox(height: 5),
          Text(
            '\$ ${product.price}.00',
            style: const TextStyle(
                color: Color(0xFF303030),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
