import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'twitter-white-logo.png',
            width: size.width * 0.07,
            height: size.height * 0.07,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              'Sucediendo ahora',
              style: GoogleFonts.montserratAlternates(
                fontSize: size.width * 0.1,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
