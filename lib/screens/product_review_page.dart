import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/widgets/product_review_card.dart';

class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({Key? key}) : super(key: key);

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
          "RATING & REVIEW",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/sample.png",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Minimal Stand",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: const Color(0xFF606060),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: SvgPicture.asset(
                              'assets/icons/star_icon.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF303030),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "10 reviews",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF303030),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 14),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Color(0xFFF0F0F0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ProductReviewCard(
                  reviewerName: "Aditya R",
                  ratingValue: index % 5 + 1,
                  dateString: "25/12/2021",
                  profileImageUrl:
                      "https://avatars.githubusercontent.com/u/62930521?v=4",
                  reviewDescription:
                      "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price",
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
