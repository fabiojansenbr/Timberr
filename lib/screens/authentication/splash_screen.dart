import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/home_controller.dart';
import 'package:timberr/screens/home.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.find();
  final FavoritesController _favoritesController = Get.find();
  final CartController _cartController = Get.find();
  Future initControllers() async {
    await _homeController.getProducts(0);
    await _favoritesController.fetchFavorites();
    await _cartController.fetchCartItems();
    Get.off(() => Home());
  }

  @override
  StatelessElement createElement() {
    initControllers();
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            LottieBuilder.asset("assets/lottie/splash_loading_animation.json"),
      ),
    );
  }
}
