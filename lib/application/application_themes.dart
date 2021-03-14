import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ApplicationThemes {
  static final ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    accentColor: Colors.pinkAccent,
    buttonColor: Colors.blue,
    hintColor: Colors.black38,
    textTheme: GoogleFonts.latoTextTheme().copyWith(
      button: GoogleFonts.latoTextTheme().button.copyWith(color: Colors.white),
    ),
  );
}
