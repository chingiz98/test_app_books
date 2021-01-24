part of 'custom_theme.dart';

class _CustomTextTheme {
  TextTheme light = const TextTheme(
    headline1: TextStyle(
      color: CustomColors.darkText,
      fontSize: 112.0,
      fontWeight: FontWeight.w100,
    ),
    headline2: TextStyle(
      color: CustomColors.darkText,
      fontSize: 56.0,
      fontWeight: FontWeight.w400,
    ),
    headline3: TextStyle(
      color: CustomColors.whiteColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      fontFamily: CustomTheme.fontUbuntu,
    ),
    bodyText1: TextStyle(
      color: CustomColors.darkText,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      color: CustomColors.whiteColor,
      fontSize: 13.0,
      fontWeight: FontWeight.w300,
      fontFamily: CustomTheme.fontUbuntu,
    ),
    overline: TextStyle(
      color: CustomColors.darkText,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
    headline4: TextStyle(
      color: CustomColors.whiteColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      fontFamily: CustomTheme.fontSourceSansPro,
    ),
    headline5: TextStyle(
      color: CustomColors.darkText,
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
    ),
    headline6: TextStyle(
      color: CustomColors.whiteColor,
      fontSize: 30.0,
      fontWeight: FontWeight.w700,
      height: 1.35,
    ),
    bodyText2: TextStyle(
      color: CustomColors.darkText,
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
      fontFamily: CustomTheme.fontSourceSansPro,
    ),
    subtitle1: TextStyle(
      color: CustomColors.darkText,
      fontSize: 17.0,
      fontWeight: FontWeight.w500,
      height: 1.35,
    ),
    caption: TextStyle(
      color: CustomColors.greyText,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    button: TextStyle(
      fontSize: 17.0,
      fontWeight: FontWeight.normal,
      height: 1.35,
      color: CustomColors.darkText,
    ),
  );
}

final _customTextTheme = _CustomTextTheme();
