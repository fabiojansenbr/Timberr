import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double height;
  final double fontSize;
  const CustomElevatedButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.height = 60,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      highlightColor: kOffBlack,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Ink(
        height: height,
        decoration: BoxDecoration(
          color: kOffBlack,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x80303030),
              offset: Offset(0, 10),
              blurRadius: 20,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.nunitoSans(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
