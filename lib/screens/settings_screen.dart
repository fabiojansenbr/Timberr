import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
          "SETTING",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Personal Information",
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  color: const Color(0xFF909090),
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
              ),
            ],
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: const Color(0xFF828282),
                  ),
                ),
                Text(
                  "Aditya R",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: const Color(0xFF828282),
                  ),
                ),
                Text(
                  "adeeteya@gmail.com",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Password",
                style: GoogleFonts.nunitoSans(
                  fontSize: 16,
                  color: const Color(0xFF909090),
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/edit_icon.svg"),
              ),
            ],
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Password",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: const Color(0xFF828282),
                  ),
                ),
                Text(
                  "**************",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Notifications",
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              color: const Color(0xFF909090),
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sales",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
                CupertinoSwitch(
                  value: true,
                  onChanged: (val) {},
                  activeColor: const Color(0xFF2AA952),
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Arrivals",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
                CupertinoSwitch(
                  value: false,
                  onChanged: (val) {},
                  activeColor: const Color(0xFF2AA952),
                ),
              ],
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery Status",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
                CupertinoSwitch(
                  value: false,
                  onChanged: (val) {},
                  activeColor: const Color(0xFF2AA952),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Text(
            "Help Center",
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              color: const Color(0xFF909090),
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x408A959E),
                  offset: Offset(0, 2),
                  blurRadius: 40,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FAQ",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF222222),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launch("https://www.youtube.com/watch?v=dQw4w9WgXcQ");
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF909090),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
