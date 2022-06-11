import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
//
// const TextStyle primaryTextStyle = TextStyle(
//     fontFamily: "NunitoSans",
//     fontSize: headline5,
//     // fontWeight: FontWeight.w300,
//     color: primaryTextColor);
//
// TextStyle buttonTextStyle = const TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: buttonLG,
//   fontWeight: FontWeight.w700,
//   color: buttonTextColor,
// );
// const TextStyle headerTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: headline1,
//   fontWeight: FontWeight.w700,
//   color: headerTextColor,
// );
// const TextStyle subHeaderTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: headline3,
//   fontWeight: FontWeight.w600,
//   color: subHeaderTextColor,
// );
// const TextStyle hintTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: input,
//   fontWeight: FontWeight.w700,
//   color: hintTextColor,
// );
//
// const TextStyle inputTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: input,
//   fontWeight: FontWeight.w600,
// );
//
// const TextStyle cardHeadersTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: headline4,
//   fontWeight: FontWeight.w400,
// );
//
// const TextStyle tagTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: tag,
//   fontWeight: FontWeight.w500,
// );
// const TextStyle textfieldHeaderTextStyle = TextStyle(
//   fontFamily: "NunitoSans",
//   fontSize: headline3,
//   fontWeight: FontWeight.w600,
//   color: primaryColor2,
// );
// const TextStyle fieldHeaderTextStyle = TextStyle(
//     fontFamily: fontName,
//     fontSize: headline5,
//     fontWeight: FontWeight.w600,
//     color: mainTextColor);

TextStyle get headerTextStyle {
  return GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Color(0xFF000000),
    ),
  );
}

TextStyle get subHeaderTextStyle {
  return GoogleFonts.lato(
    textStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade500,
    ),
  );
}

TextStyle get buttonTextStyle {
  return GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get textFieldHeaderStyle {
  return GoogleFonts.lato(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );
}

TextStyle get hintTextStyle {
  return GoogleFonts.lato(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
}

TextStyle get inputTextStyle {
  return GoogleFonts.lato(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
}
