import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/wrapper.dart';

class UserController extends GetxController {
  final _supabaseClient = Supabase.instance.client;
  String name = "", email = "";
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  Future fetchUserData() async {
    final response = await _supabaseClient
        .from("Users")
        .select("Name, Email")
        .eq("Uid", _supabaseClient.auth.user()?.id)
        .execute();
    name = response.data[0]['Name'];
    email = response.data[0]['Email'];
    update();
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
          await _supabaseClient.auth.signOut();
          Get.offAll(() => const Wrapper());
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
}
