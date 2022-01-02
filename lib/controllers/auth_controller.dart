import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/wrapper.dart';

class AuthController extends GetxController {
  final _authController = Supabase.instance;
  User? get user => _authController.client.auth.currentUser;

  Future signIn(String email, String password) async {
    final response = await _authController.client.auth
        .signIn(email: email, password: password);
    if (response.error != null) {
      Get.defaultDialog(
        title: 'Error',
        titlePadding: const EdgeInsets.all(20),
        barrierDismissible: false,
        middleText: response.error?.message ?? 'Some Unknown Error occurred',
        cancel: TextButton(
          child: const Text('OK'),
          onPressed: () {
            navigator!.pop();
          },
        ),
      );
    } else {
      // Sign in with success
      Get.offAll(() => const Wrapper());
    }
  }

  Future signUp(String name, String email, String password) async {
    final response = await _authController.client.auth.signUp(email, password);
    if (response.error != null &&
        response.error!.message !=
            'Thanks for registering, now check your email to complete the process.') {
      // Handle error
      Get.defaultDialog(
        title: 'Error',
        titlePadding: const EdgeInsets.all(20),
        barrierDismissible: false,
        middleText: response.error?.message ?? 'Some Unknown Error occurred',
        cancel: TextButton(
          child: const Text('OK'),
          onPressed: () {
            navigator!.pop();
          },
        ),
      );
    } else {
      // check is session is null(user already exists) else sign in
      if (response.data == null) {
        Get.defaultDialog(
          title: 'Error',
          titlePadding: const EdgeInsets.all(20),
          barrierDismissible: false,
          middleText: 'User already Exists',
          cancel: TextButton(
            child: const Text('OK'),
            onPressed: () {
              navigator!.pop();
            },
          ),
        );
      } else {
        _authController.client.from('Users').insert({
          'Name': name,
          'Email': email,
          'Uid': response.user!.id,
          'favoritesList': [],
          'cartList': [],
        }).execute();
        Get.offAll(() => const Wrapper());
      }
    }
  }

  Future signOut() async {
    Get.defaultDialog(
      title: 'SignOut',
      titlePadding: const EdgeInsets.all(20),
      middleText: "Are you sure you want to sign out?",
      cancel: TextButton(
        onPressed: () {
          navigator?.pop();
        },
        child: Text(
          "Cancel",
          style: GoogleFonts.nunitoSans(
            color: const Color(0xFFEB5757),
          ),
        ),
      ),
      confirm: TextButton(
        onPressed: () async {
          await _authController.client.auth.signOut();
        },
        child: Text(
          "Yes",
          style: GoogleFonts.nunitoSans(
            color: const Color(0xFF303030),
          ),
        ),
      ),
    );
  }

  Future forgotPassword(String email) async {
    await _authController.client.auth.api.resetPasswordForEmail(email);
    Get.snackbar("Password reset",
        "Password reset request has been sent to your email successfully.");
  }
}
