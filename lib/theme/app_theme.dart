import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFc44dff);
const kPrimaryLightColor = Color(0xFFf0d3ff);
const primaryDarkColor = Color(0xFF8936b3);
const secondaryColor = Color(0xFFe1a6ff);
const secondaryLightColor = Color(0xFFe1a6ff);
const secondaryDarkColor = Color(0xFFe1a6ff);

ThemeData get appThemeData => ThemeData(
      primaryColor: kPrimaryColor,
      primaryColorLight: kPrimaryLightColor,
      appBarTheme: appBarTheme,
    );

AppBarTheme get appBarTheme => const AppBarTheme(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.8),
      elevation: 0,
      iconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0.5)),
      actionsIconTheme: IconThemeData(color: Color.fromRGBO(0, 0, 0, 0.5)),
    );
