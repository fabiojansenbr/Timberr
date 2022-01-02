import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTile extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onTap;
  const ProfileTile(
      {Key? key,
      required this.name,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x408A959E),
            offset: Offset(0, 7),
            blurRadius: 40,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF303030),
                ),
              ),
              Text(
                description,
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  color: const Color(0xFF808080),
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              onTap();
            },
            iconSize: 20,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF909090),
            ),
          )
        ],
      ),
    );
  }
}