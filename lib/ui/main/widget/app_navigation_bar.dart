import 'package:flutter/material.dart';

import '../../../utils/tools/file_importer.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxBloc,TabBoxState>(
      builder: (context, state) =>
          BottomNavigationBar(
            backgroundColor: AppColors.cWhite,
            items: <BottomNavigationBarItem>[
              bottomNavCustomItem(
                title: 'Главная',
                unSelectedIconPath: AppIcons.home,
                selectedIconPath: AppIcons.home,
                isSelected: state.index == 0,
              ),
              bottomNavCustomItem(
                title: 'Поиск',
                unSelectedIconPath: AppIcons.search,
                selectedIconPath: AppIcons.search,
                isSelected: state.index == 1,
              ),
              bottomNavCustomItem(
                title: 'Корзина',
                unSelectedIconPath: AppIcons.box,
                selectedIconPath: AppIcons.box,
                isSelected: state.index == 2,
              ),
              bottomNavCustomItem(
                title: 'Аккаунт',
                unSelectedIconPath: AppIcons.profile,
                selectedIconPath: AppIcons.profile,
                isSelected: state.index == 3,
              ),
            ],
            currentIndex: state.index,
            selectedItemColor: AppColors.c3364E0,
            unselectedItemColor: AppColors.cA5A9B2,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: AppTextStyles.sfProDisplay(context, fontSize: 12.sp,color: AppColors.c3364E0,fontWeight: FontWeight.w500),
            unselectedLabelStyle:
            AppTextStyles.sfProDisplay(context, fontSize: 12.sp,color: AppColors.cA5A9B2,fontWeight: FontWeight.w500),

            onTap: (value) {
              context.read<TabBoxBloc>().add(ChangeIndexEvent(value));
            },
          ),
    );
  }
}

BottomNavigationBarItem bottomNavCustomItem({
  required String title,
  required String unSelectedIconPath,
  required String selectedIconPath,
  required bool isSelected,
  bool haveNewItem = false,
}) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      height: 25.h,
      width: 25.w,
      child: Stack(
        children: [
          SvgPicture.asset(
            isSelected ? selectedIconPath : unSelectedIconPath,
            height: 24.h,
            width: 24.w,
            color: isSelected ? AppColors.c3364E0 : AppColors.cA5A9B2,
          ),
          if (haveNewItem)
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 9.h,
                width: 9.w,
                decoration: const BoxDecoration(
                  color: AppColors.c3364E0,
                  shape: BoxShape.circle,
                ),
              ),
            )
        ],
      ),
    ),
    label: title,
  );
}