import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/screens/add_shipping_screen.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({Key? key}) : super(key: key);

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
          "SHIPPING ADDRESS",
          style: GoogleFonts.merriweather(
            color: const Color(0xFF303030),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => AddShippingScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
        elevation: 8,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF303030),
        child: const Icon(
          Icons.add,
          size: 34,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                    child: Checkbox(
                      value: (index == 0) ? true : false,
                      onChanged: (isSelected) {},
                      activeColor: const Color(0xFF303030),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      splashRadius: 20,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  Text(
                    "Use as the shipping address",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      color: const Color(0xFF808080),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                height: 125,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x408A959E),
                      offset: Offset(0, 8),
                      blurRadius: 40,
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Aditya R",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF303030),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/edit_icon.svg",
                            height: 24,
                            width: 24,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Color(0xFFF0F0F0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Text(
                        "87 Town square apts, Luz corner road, Mylapore, Chennai, 600004",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          color: const Color(0xFF808080),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          );
        },
      ),
    );
  }
}
