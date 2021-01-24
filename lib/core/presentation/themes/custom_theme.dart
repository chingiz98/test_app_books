import 'package:flutter/material.dart';
import 'package:testapp/core/presentation/themes/custom_colors.dart';

part 'custom_text_theme.dart';

class CustomTheme {
  const CustomTheme._();

  static const String fontUbuntu = 'Ubuntu';
  static const String fontJosefinSans = 'JosefinSans';
  static const String fontSourceSansPro = 'SourceSansPro';
  static const String fontSFPro = 'SFPro';

  static final mode = {
    ThemeMode.light: ThemeData(
      accentColor: CustomColors.accentOrange,
      fontFamily: fontUbuntu,
      primaryColor: CustomColors.whiteColor,
      scaffoldBackgroundColor: CustomColors.backgroundColor,
      textTheme: _customTextTheme.light,
    ),
  };

  static const textWhite16Ubuntu700 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 16.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w700,
  );

  static const textWhite16Ubuntu500 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 16.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w500,
  );

  static const textAccentViolet16Ubuntu700 = TextStyle(
    color: CustomColors.accentViolet,
    fontSize: 16.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w700,
  );
  static const textAccentViolet16Ubuntu500 = TextStyle(
    color: CustomColors.accentViolet,
    fontSize: 16.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w500,
  );

  static const gradientColorTheme = LinearGradient(
    colors: [
      CustomColors.beginGradientAppBarThemeColor,
      CustomColors.endGradientAppBarThemeColor,
    ],
  );

  static const linearGradientWideActionButton = LinearGradient(
    colors: [
      CustomColors.beginGradientButtonTheme,
      CustomColors.endGradientButtonTheme
    ],
  );

  static final whiteButtonTheme = BoxDecoration(
    color: CustomColors.whiteColor,
    borderRadius: BorderRadius.circular(24.0),
  );

  static final gradientButtonTheme = BoxDecoration(
    gradient: linearGradientWideActionButton,
    borderRadius: BorderRadius.circular(24.0),
  );

  static final transparentWhiteButtonTheme = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      color: CustomColors.whiteColor,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(24.0),
  );

  static final transparentAccentVioletButtonTheme = BoxDecoration(
    color: Colors.transparent,
    border: Border.all(
      color: CustomColors.accentViolet,
      width: 2.0,
    ),
    borderRadius: BorderRadius.circular(24.0),
  );

  static const textAccentRed14SourceSansPro600 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 14.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w600,
  );

  static const textWhite15SourceSansPro600 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 15.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w600,
  );

  static const textGray10SourceSansPro400 = TextStyle(
    color: CustomColors.greyText,
    fontSize: 10.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w400,
  );

  static const textGray15SourceSansPro400 = TextStyle(
    color: CustomColors.greyText,
    fontSize: 15.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w400,
  );

  static final outLineBorderTextField = BoxDecoration(
    border: Border.all(color: CustomColors.greyTextOpacity15),
    borderRadius: BorderRadius.circular(14.0),
  );

  static final underLineBorderTextField = BoxDecoration(
    border: Border(
      bottom: BorderSide(color: CustomColors.greyTextOpacity15),
    ),
  );

  static const textDark17Ubuntu700 = TextStyle(
    color: CustomColors.darkText,
    fontSize: 17.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w700,
  );

  static const textDark14SourceSansPro400 = TextStyle(
    color: CustomColors.darkText,
    fontSize: 14.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w400,
  );

  static const textAccentViolet17SFPro600 = TextStyle(
    color: CustomColors.accentViolet,
    fontSize: 17.0,
    fontFamily: fontSFPro,
    fontWeight: FontWeight.w600,
  );

  static const textDark17SFPro600 = TextStyle(
    color: CustomColors.darkText,
    fontSize: 17.0,
    fontFamily: fontSFPro,
    fontWeight: FontWeight.w600,
  );

  static const textWhite24Ubuntu700 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 24.0,
    fontFamily: fontUbuntu,
    fontWeight: FontWeight.w700,
  );

  static const textWhite14SourceSansPro400 = TextStyle(
    color: CustomColors.whiteColor,
    fontSize: 14.0,
    fontFamily: fontSourceSansPro,
    fontWeight: FontWeight.w400,
  );

  static const cardDecoration = BoxDecoration(
    color: CustomColors.whiteColor,
    gradient: LinearGradient(
      begin: Alignment(-1.0, 1.5),
      end: Alignment(1.0, -1.5),
      colors: [
        CustomColors.cardGradientColorOne,
        CustomColors.cardGradientColorTwo,
        CustomColors.cardGradientColorThree
      ],
      stops: [
        0.0,
        0.3,
        1.0,
      ],
    ),
  );
}
