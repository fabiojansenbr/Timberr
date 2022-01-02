import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationTile extends StatelessWidget {
  final String name;
  final String description;
  final bool isNew;
  const NotificationTile(
      {Key? key,
      required this.name,
      required this.description,
      required this.isNew})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 95,
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          color: (isNew) ? const Color(0xFFF0F0F0) : Colors.white,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  "assets/sample.png",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 12,
                        color: const Color(0xFF303030),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      description,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 10,
                        color: const Color(0xFF808080),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        if (isNew)
          Positioned(
            bottom: 10,
            right: 20,
            child: Text(
              "New",
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF27AE60),
              ),
            ),
          ),
      ],
    );
  }
}
