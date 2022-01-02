import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductReviewCard extends StatelessWidget {
  final String reviewerName;
  final String dateString;
  final int ratingValue;
  final String reviewDescription;
  final String profileImageUrl;
  const ProductReviewCard(
      {Key? key,
      required this.reviewerName,
      required this.dateString,
      required this.ratingValue,
      required this.reviewDescription,
      required this.profileImageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              height: 190,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x408A959E),
                    offset: Offset(0, 8),
                    blurRadius: 40,
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          reviewerName,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF303030),
                          ),
                        ),
                        Text(
                          dateString,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 12,
                            color: const Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < ratingValue; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: SvgPicture.asset(
                              'assets/icons/star_icon.svg',
                              height: 16,
                              width: 16,
                            ),
                          ),
                      ],
                    ),
                    Text(
                      reviewDescription,
                      maxLines: 5,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 14,
                        color: const Color(0xFF303030),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                profileImageUrl,
              ),
            ),
          )
        ],
      ),
    );
  }
}
