import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/models/address.dart';
import 'package:timberr/screens/edit_shipping_screen.dart';

class AddressCard extends StatelessWidget {
  final Address? address;
  final int index;
  final bool isEditable;
  const AddressCard(
      {Key? key, this.isEditable = true, this.address, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                AnimatedOpacity(
                  opacity: (address == null) ? 0 : 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeIn,
                  child: Text(
                    address?.name ?? "",
                    style: GoogleFonts.nunitoSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF303030),
                    ),
                  ),
                ),
                if (isEditable)
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => EditShippingScreen(
                          initialAddress: address!,
                          index: index,
                        ),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/icons/edit_icon.svg",
                      height: 24,
                      width: 24,
                      fit: BoxFit.scaleDown,
                    ),
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
            child: AnimatedOpacity(
              opacity: (address == null) ? 0 : 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              child: Text(
                address?.displayAddress() ?? "",
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  color: const Color(0xFF808080),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
