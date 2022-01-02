import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryButton extends StatelessWidget {
  final String iconPath;
  final String name;
  final bool isSelected;
  final void Function() onTap;
  const CategoryButton(
      {Key? key,
      required this.iconPath,
      required this.name,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: (isSelected)
                    ? const Color(0xFF303030)
                    : const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(
                iconPath,
                fit: BoxFit.none,
                color: (isSelected) ? Colors.white : const Color(0xFF909090),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: (isSelected)
                    ? const Color(0xFF303030)
                    : const Color(0xFF808080),
                fontWeight: (isSelected) ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
