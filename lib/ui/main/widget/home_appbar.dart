import 'package:flutter/material.dart';
import 'package:food_app/utils/tools/file_importer.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {

   const HomeAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
          onTap: ((){
            Navigator.pop(context);
          }),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: SvgPicture.asset(AppIcons.location),
          )),
      actions: [
        SizedBox(width: width(context)*0.12,),
        SizedBox(
          height: 20.h,
          width: width(context)*0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h,),
              Text("Санкт-Петербург", style: AppTextStyles.sfProDisplay(context,fontWeight: FontWeight.w600),),
              Text("${DateTime.now().day} ${_getMonthName(DateTime.now().month)} ${DateTime.now().year}", style: AppTextStyles.sfProDisplay(context),),
            ],
          ),

        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SvgPicture.asset(AppIcons.avatar, height: 40.h,),
        ),
        // SizedBox(width: 10.w,)
      ],
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}