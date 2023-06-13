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
                   message: "",
                  onPinPressed: (()async{
                    context.read<FoodBloc>().add(FoodPriceEvent(price: filteredDishes[index].price));
                    context.read<FoodBloc>().add(FoodSaveEvent(foodIndex: filteredDishes[index].id));
                    Navigator.pop(context);
                    showSnackbar(context: context, message: "${filteredDishes[index].name} добавлен в корзину");
                    // SaveBoxService.instance.
                    // final box = await Hive.openBox('list');
                  }),
                );
              },
            );
          }),
          child: Column(
            children: [
              SizedBox(
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
              ),
              Text(filteredDishes[index].name.toString(),textAlign: TextAlign.center, maxLines: 2, style: AppTextStyles.sfProDisplay(context),)
            ],
          ),
        );
      },
    );
  }
}
