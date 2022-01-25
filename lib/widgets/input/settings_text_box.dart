import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';

class SettingsTextBox extends StatelessWidget {
  final String fieldName;
  final String value;

  const SettingsTextBox(
      {Key? key, required this.fieldName, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            fieldName,
            style: GoogleFonts.nunitoSans(
              fontSize: 12,
              color: kTrolleyGrey,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: kRaisinBlack,
            ),
          ),
        ],
      ),
    );
  }
}
