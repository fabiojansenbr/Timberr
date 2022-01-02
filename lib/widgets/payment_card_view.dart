import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCardView extends StatelessWidget {
  final bool? isMasterCard;
  final bool isSelected;
  final String lastFourDigits;
  final String cardHolderName;
  final String expiryDateString;
  const PaymentCardView(
      {Key? key,
      this.lastFourDigits = "XXXX",
      this.cardHolderName = "XXXXXX",
      this.expiryDateString = "XX/XX",
      this.isSelected = true,
      this.isMasterCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        color: (isSelected) ? const Color(0xFF222222) : const Color(0xFF999999),
        image: const DecorationImage(
          image: AssetImage("assets/card_bg.png"),
          alignment: Alignment(1.3, 1.3),
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            offset: Offset(0, 1),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Color(0x80000000),
            offset: Offset(0, 0.97),
            blurRadius: 24.27,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isMasterCard == null)
              ? Row(
                  children: [
                    SvgPicture.asset("assets/icons/mastercard.svg"),
                    const SizedBox(width: 20),
                    SvgPicture.asset("assets/icons/visacard.svg")
                  ],
                )
              : SvgPicture.asset(
                  (isMasterCard!)
                      ? "assets/icons/mastercard.svg"
                      : "assets/icons/visacard.svg",
                ),
          RichText(
            text: TextSpan(
              text: "* * * *  * * * *  * * * *  ",
              style: GoogleFonts.nunitoSans(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: lastFourDigits,
                  style: GoogleFonts.nunitoSans(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Card Holder Name",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    cardHolderName,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Expiry Date",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  Text(
                    expiryDateString,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
