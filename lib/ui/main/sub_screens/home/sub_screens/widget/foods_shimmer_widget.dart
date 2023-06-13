import '../../../../../../utils/tools/file_importer.dart';
class FoodsShimmerWidget extends StatelessWidget {
  const FoodsShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height(context),
      child: SafeArea(
        child: Column(children: [
          SizedBox(height: 20.h,),
          SizedBox(
            height: height(context) * 0.04,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 10.w),
                      height: height(context) * 0.04,
                      width: width(context) * 0.19,
                      decoration: BoxDecoration(
                          color: AppColors.cF8F7F5,
                          borderRadius:
                          BorderRadius.circular(15)),
                    ),
                  );
                }),
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child:GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 0.72
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            height: height(context)*0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColors.cF8F7F5,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 15.h,
                            width: width(context)*0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(6.r)
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
            ),
          ),
        ],),
      ),);
  }
}
