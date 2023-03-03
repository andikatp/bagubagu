import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constants/color.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 34, top: 50, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hey, Andika',
            textAlign: TextAlign.start,
            style: GoogleFonts.roboto(
              color: secondary,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Find the latest Updates',
            style: GoogleFonts.roboto(
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
