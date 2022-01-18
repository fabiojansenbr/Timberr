import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timberr/wrapper.dart';

class UserController extends GetxController {
  final _supabaseClient = Supabase.instance.client;
  String name = "", email = "";
  String? profilePictureUrl;
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  Future fetchUserData() async {
    final response = await _supabaseClient
        .from("Users")
        .select("Name, Email, profile_picture_url")
        .eq("Uid", _supabaseClient.auth.user()?.id)
        .execute();
    name = response.data[0]['Name'];
    email = response.data[0]['Email'];
    profilePictureUrl = response.data[0]['profile_picture_url'];
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

  Future uploadProfilePicture() async {
    final _imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (_imageFile == null) {
      return;
    }
    final bytes = await _imageFile.readAsBytes();
    final fileExt = _imageFile.path.split('.').last;
    final filePath = '${_supabaseClient.auth.currentUser?.id}.$fileExt';
    final response =
        await _supabaseClient.storage.from('profile-pics').uploadBinary(
              filePath,
              bytes,
              fileOptions: const FileOptions(upsert: true),
            );
    if (response.hasError) {
      return;
    }
    final imageUrlResponse =
        _supabaseClient.storage.from('profile-pics').getPublicUrl(filePath);

    //update profile picture url
    profilePictureUrl = imageUrlResponse.data;
    if (profilePictureUrl != null) {
      profilePictureUrl =
          profilePictureUrl! + "?v=" + DateTime.now().toIso8601String();
    }
    update();
    await _supabaseClient
        .from("Users")
        .update({"profile_picture_url": imageUrlResponse.data})
        .eq("Uid", _supabaseClient.auth.currentUser?.id)
        .execute();
  }
}
