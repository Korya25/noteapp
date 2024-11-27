import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Heading text style (for titles, large text)
  static TextStyle heading = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w300,
    ),
  );

  static TextStyle noteTitle = GoogleFonts.poppins(
    textStyle: const TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  static TextStyle noteDescription = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18,
      color: Colors.black.withOpacity(0.6),
    ),
  );

  static TextStyle noteDate = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 15,
      color: Colors.black.withOpacity(0.7),
    ),
  );

  static TextStyle CustomTextFieldBottonShate = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 15,
      color: const Color.fromARGB(255, 26, 194, 101),
    ),
  );
}
