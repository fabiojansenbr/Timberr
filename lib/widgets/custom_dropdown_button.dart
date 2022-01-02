import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdownButton extends StatefulWidget {
  final String headerText;
  final String hintText;
  final List<DropdownMenuItem> items;
  final Function(String val) onChanged;
  const CustomDropdownButton(
      {Key? key,
      required this.headerText,
      required this.hintText,
      required this.items,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool isFilled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 4, 10),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: (isFilled) ? Colors.white : const Color(0xFFF7F7F7),
        border: (isFilled)
            ? Border.all(
                color: const Color(0xFFE0E0E0),
              )
            : const Border(),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headerText,
            style: GoogleFonts.nunitoSans(
              fontSize: 12,
              color: const Color(0xFF828282),
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonFormField(
            isDense: true,
            alignment: AlignmentDirectional.bottomEnd,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isCollapsed: true,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.nunitoSans(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFBDBDBD),
              ),
              border: InputBorder.none,
            ),
            items: widget.items,
            onChanged: (dynamic val) {
              setState(() {
                isFilled = true;
              });
              widget.onChanged(val);
            },
          ),
        ],
      ),
    );
  }
}
