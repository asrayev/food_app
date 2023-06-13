import '../../../../../../utils/tools/file_importer.dart';

// ignore: must_be_immutable
class AddBoxDialog extends StatelessWidget {
  final Dishes dishes;
  final String message;
  VoidCallback onPinPressed;

  AddBoxDialog({super.key, required this.message, required this.onPinPressed, required this.dishes});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: height(context)*0.3,
        child: Column(
          children: [
            Text(dishes.name!, style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp),maxLines: 2,textAlign: TextAlign.center,),
            const Spacer(),
            GestureDetector(
              onTap:onPinPressed,
              child: Container(
                height: height(context)*0.045,
                width: width(context)*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.c3364E0,
                ),
                child: Center(
                  child: Text("Добавить в корзину", style: AppTextStyles.sfProDisplay(context, color: AppColors.cWhite),),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.cWhite,

    );
  }
}
