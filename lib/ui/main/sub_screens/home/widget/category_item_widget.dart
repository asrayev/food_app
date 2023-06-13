import '../../../../../utils/tools/file_importer.dart';

class CategoryItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;
  const CategoryItemWidget({Key? key, required this.name, required this.imageUrl, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        height: height(context)*0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(imageUrl)
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              SizedBox(
                  width: width(context)*0.4,
                  child: Text(name, maxLines: 2, style: AppTextStyles.sfProDisplay(context, fontSize: 20.sp),)),
            ],
          ),
        ),
      ),
    );
  }
}
