import 'package:food_app/ui/main/sub_screens/home/sub_screens/widget/dialog_widget.dart';
import 'package:food_app/utils/tools/file_importer.dart';

class FoodGridWidget extends StatelessWidget {
  final List<Dishes> filteredDishes;
  const FoodGridWidget({Key? key, required this.filteredDishes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: filteredDishes.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.72
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ((){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddBoxDialog(
                  dishes: filteredDishes[index],
                   message: "asdasdasdasd",
                  onPinPressed: ((){}),
                );
              },
            );
          }),
          child: Column(
            children: [
              Container(
                height: height(context)*0.15,
               child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: CachedNetworkImage(
                    imageUrl: filteredDishes[index].imageUrl!,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        height: height(context)*0.15,
                        decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                  ),
                ),
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10.r),
                //     color: AppColors.cF8F7F5,
                //     image: DecorationImage(
                //         image: NetworkImage(filteredDishes[index].imageUrl.toString())
                //     )
                //
                // ),

              ),
              Text(filteredDishes[index].name.toString(),textAlign: TextAlign.center, maxLines: 2, style: AppTextStyles.sfProDisplay(context),)
            ],
          ),
        );
      },
    );
  }
}
