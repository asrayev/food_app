import 'package:flutter/material.dart';
import 'package:food_app/utils/tools/file_importer.dart';

class AppTextStyles{
  static TextStyle sfProDisplay(context,{Color? color,double? fontSize,FontWeight? fontWeight}) => TextStyle(fontFamily: "SFPRO",fontWeight: fontWeight??FontWeight.w400,fontSize: 14.sp,color: color?? AppColors.cBlack);

}