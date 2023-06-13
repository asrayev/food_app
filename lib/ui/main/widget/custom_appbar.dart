import 'package:flutter/material.dart';
import 'package:food_app/utils/tools/file_importer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: ((){
            Navigator.pop(context);
          }),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(AppIcons.back),
          )),
      actions: [
        Center(child: SizedBox(
width: width(context)*0.7,
            child: Text(title, style: AppTextStyles.sfProDisplay(context, fontWeight: FontWeight.w600,).copyWith(fontSize: 18.sp), textAlign: TextAlign.center,))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SvgPicture.asset(AppIcons.avatar, height: 40.h,),
        ),
        SizedBox(width: 10.w,)
      ],
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}