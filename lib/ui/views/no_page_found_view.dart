import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Text(
        '404 - No se encontró la página',
        style: GoogleFonts.montserratAlternates(
          fontSize: size.width * 0.07,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
