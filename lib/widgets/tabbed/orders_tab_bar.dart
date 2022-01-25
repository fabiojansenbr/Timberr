import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';

class OrdersTabBar extends StatelessWidget with PreferredSizeWidget {
  final int index;
  const OrdersTabBar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivered",
                style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  fontWeight:
                      (index == 0) ? FontWeight.bold : FontWeight.normal,
                  color: (index == 0) ? kOffBlack : kTinGrey,
                ),
              ),
              if (index == 0)
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kOffBlack,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Processing",
                style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  fontWeight:
                      (index == 1) ? FontWeight.bold : FontWeight.normal,
                  color: (index == 1) ? kOffBlack : kTinGrey,
                ),
              ),
              if (index == 1)
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kOffBlack,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cancelled",
                style: GoogleFonts.nunitoSans(
                  fontSize: 18,
                  fontWeight:
                      (index == 2) ? FontWeight.bold : FontWeight.normal,
                  color: (index == 2) ? kOffBlack : kTinGrey,
                ),
              ),
              if (index == 2)
                Container(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(
                    color: kOffBlack,
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 40);
}
