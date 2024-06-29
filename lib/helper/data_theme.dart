import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataTheme {
  ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.orange,
      brightness: Brightness.light,
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.poppinsTextTheme(
        TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Example for body text
          bodySmall: TextStyle(color: Colors.black87), // Example for body text
          bodyLarge: TextStyle(color: Colors.black), // Example for body text
          headlineMedium: TextStyle(color: Colors.black), // Example for headlines
          headlineLarge: TextStyle(color: Colors.black), // Example for headlines
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      primaryColor: Colors.orange,
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Example for body text
          bodySmall: TextStyle(color: Colors.white), // Example for body text
          bodyLarge: TextStyle(color: Colors.white), // Example for body text
          headlineMedium: TextStyle(color: Colors.white), // Example for headlines
          headlineLarge: TextStyle(color: Colors.white), // Example for headlines
      ),
    ));
  }
}
