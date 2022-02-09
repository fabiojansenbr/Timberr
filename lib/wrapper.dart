import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/controllers/cart_controller.dart';
import 'package:timberr/controllers/favorites_controller.dart';
import 'package:timberr/controllers/home_controller.dart';
import 'package:timberr/screens/authentication/onboarding_welcome.dart';
import 'package:timberr/screens/authentication/splash_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends AuthState<Wrapper> {
  @override
  void initState() {
    recoverSupabaseSession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class AuthState<T extends StatefulWidget> extends SupabaseAuthState<T> {
  @override
  void onUnauthenticated() {
    if (mounted) {
      Get.off(() => const OnBoardingWelcomeScreen());
    }
  }

  @override
  void onAuthenticated(Session session) {
    if (mounted) {
      Get.put(HomeController(), permanent: true);
      Get.put(FavoritesController(), permanent: true);
      Get.put(CartController(), permanent: true);
      Get.off(() => SplashScreen(), transition: Transition.fadeIn);
    }
  }

  @override
  void onPasswordRecovery(Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    Get.snackbar('Error', message);
  }
}
