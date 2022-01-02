import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/widgets/bottom_navbar.dart';
import 'package:timberr/widgets/notification_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search_icon.svg"),
        ),
        title: Text(
          "NOTIFICATION",
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const BottomNavBar(selectedPos: 2),
      body: ListView.separated(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return NotificationTile(
            name: "Your order #124582 has been confirmed",
            description:
                "Lorem ipsum dolor amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
            isNew: (index == 1 || index == 8) ? true : false,
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
            thickness: 1,
            color: Color(0xFFF0F0F0),
            indent: 20,
            endIndent: 20,
          );
        },
      ),
    );
  }
}
