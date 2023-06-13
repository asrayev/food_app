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
        height: height(context)*0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height(context)*0.2,
              width: width(context)*0.85,
              decoration: BoxDecoration(
                color: AppColors.cF8F7F5,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(image: NetworkImage(dishes.imageUrl!)),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(AppIcons.favorite),
                    SizedBox(width: 5.w,),
                    GestureDetector(
                        onTap: ((){
                          Navigator.pop(context);
                        }),
                        child: SvgPicture.asset(AppIcons.cancel)),

                ],),
              ),
            ),
            SizedBox(height: 5.h,),
            Text(dishes.name!, style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w600),maxLines: 2,textAlign: TextAlign.center,),
            SizedBox(height: 5.h,),
            Row(
              children: [
                Text("${dishes.price.toString()} ₽", style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w500),maxLines: 1,textAlign: TextAlign.center,),
                Text(" . ${dishes.weight.toString()} г", style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.grey),maxLines: 1,textAlign: TextAlign.center,),
              ],
            ),
            SizedBox(height: 5.h,),
            SizedBox(
              child: Text(dishes.description!, style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.grey),maxLines: 5,textAlign: TextAlign.start,),

            ),
            SizedBox(height: 10.h,),
            Center(
              child: GestureDetector(
                onTap:onPinPressed,
                child: Container(
                  height: height(context)*0.045,
                  width: width(context)*0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.c3364E0,
                  ),
                  child: Center(
                    child: Text("Добавить в корзину", style: AppTextStyles.sfProDisplay(context, color: AppColors.cWhite),),
                  ),
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
