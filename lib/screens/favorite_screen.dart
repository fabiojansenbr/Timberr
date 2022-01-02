import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/widgets/bottom_navbar.dart';
import 'package:timberr/widgets/favorite_list_tile.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final FavoritesController _favoritesController = Get.find();
  final CartController _cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search_icon.svg"),
        ),
        title: Text(
          "FAVORITE",
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/cart_icon.svg"),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedPos: 1),
      body: Obx(() {
        if (_favoritesController.favoritesList.isEmpty) {
          return const Center(
              child: Text("No Product added to favorites List"));
        } else {
          return Stack(
            children: [
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: _favoritesController.favoritesList.length,
                itemBuilder: (context, index) {
                  return FavoriteListTile(
                    product:
                        _favoritesController.favoritesList.elementAt(index),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 12,
                    thickness: 1,
                    color: Color(0xFFF0F0F0),
                    indent: 20,
                    endIndent: 20,
                  );
                },
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 10,
                child: ElevatedButton(
                  onPressed: () async {
                    for (int i = 0;
                        i < _favoritesController.favoritesList.length;
                        i++) {
                      await _cartController.addToCart(
                          _favoritesController.favoritesList.elementAt(i),
                          _favoritesController.favoritesList
                              .elementAt(i)
                              .colorsList[0],
                          showSnackbar: false);
                    }
                    Get.snackbar("Added to Cart",
                        "All the favorite items have been added to the cart");
                  },
                  child: Text(
                    "Add all to my cart",
                    style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    minimumSize: const Size(50, 50),
                    primary: const Color(0xFF303030),
                    shadowColor: const Color(0xFF303030),
                  ),
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
