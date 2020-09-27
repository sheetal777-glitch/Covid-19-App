import 'package:corona_tracking/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopCards extends StatelessWidget {
  final String titleText;
  final String detailsText;
  final Color color;

  TopCards(
      {@required this.titleText,
      @required this.detailsText,
      @required this.color});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top - //status bar
        kToolbarHeight; //appbar
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: color,
      elevation: 5,
      child: Container(
        height: height * 0.2,
        width: width * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              titleText,
              style: GoogleFonts.merriweather(
                fontSize: 17,
                fontWeight: FontWeight.w800,
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
    );
  }
}
