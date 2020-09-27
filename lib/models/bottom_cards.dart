import 'package:corona_tracking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomCards extends StatelessWidget {
  final String titleText;
  final String detailsText;
  final Color color;

  BottomCards(
      {@required this.titleText,
      @required this.detailsText,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        color: color,
        elevation: 7,
        child: Container(
          height: 120,
          width: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                titleText,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              CustomText(
                text: detailsText,
                size: 20,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
