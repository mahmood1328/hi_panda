import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static TextStyle bodyText1 = const TextStyle(
      color: ColorsApp.primaryTextColor,
      fontSize: 24,fontFamily: "robot",
      fontWeight: FontWeight.w800);

  static TextStyle subtitle1 =
  const TextStyle(color: ColorsApp.secondaryTextColor, fontSize: 24 , fontWeight: FontWeight.w300,fontFamily: "robot",);

  static TextStyle bodyText2 = const TextStyle(
      color: ColorsApp.primaryTextColor,
      fontSize: 16,fontFamily: "robot",
      fontWeight: FontWeight.w800);

  static TextStyle subtitle2 =
  const TextStyle(color: ColorsApp.secondaryTextColor, fontSize: 12,fontFamily: "robot",fontWeight: FontWeight.normal);

  static TextStyle overLine =
  const TextStyle(fontSize: 14, color: Colors.black , fontWeight: FontWeight.w500,fontFamily: "robot",);

  static TextStyle float =
   const TextStyle(fontSize: 14, color: Color(0xFF04dace) , fontWeight: FontWeight.w500,fontFamily: "robot",);

  static TextStyle overLineMap =
  const TextStyle(fontSize: 10, color: Colors.black , fontWeight: FontWeight.w500,fontFamily: "robot",);

  static TextStyle homeTitle = const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,fontFamily: "robot",
      color: ColorsApp.greenBlueLight);

  static TextStyle headLine6 = const TextStyle(
      color: ColorsApp.primaryTextColor,fontFamily: "robot",fontWeight: FontWeight.normal,
      fontSize: 30,);

  static TextStyle headLine5 = const TextStyle(
      color: ColorsApp.primaryTextColor,fontFamily: "robot",
      fontSize: 34,);
}
