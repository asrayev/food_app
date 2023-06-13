import 'package:food_app/utils/tools/file_importer.dart';

class BoxShimmerWidget extends StatelessWidget {
  const BoxShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index){
                return
                  Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height(context)*0.1,
                          width: width(context),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                      )
                  );

              }),
        ));
  }
}
