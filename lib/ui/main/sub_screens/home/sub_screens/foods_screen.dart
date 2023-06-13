import '../../../../../utils/tools/file_importer.dart';

class AllFoodsScreen extends StatefulWidget {
  const AllFoodsScreen({Key? key}) : super(key: key);

  @override
  State<AllFoodsScreen> createState() => _AllFoodsScreenState();
}

class _AllFoodsScreenState extends State<AllFoodsScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if(state.responseStatus == ResponseStatus.inProgress){
            return const FoodsShimmerWidget();
          }else if(state.responseStatus == ResponseStatus.inSuccess){
            FoodsModel categoryModel = state.foodsModel!;
            List allTegList = [];
            allTegList.addAll(categoryModel.dishes!.expand((dish) => dish.tegs!).toSet());
            List<Dishes> filteredDishes = categoryModel.dishes!.where((dish) => (dish.tegs.toString()).contains(allTegList[currentIndex])).toList();
            return SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 20.h,),
                    SizedBox(
                    height: height(context) * 0.04,
                    child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allTegList.length,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: (() {
                           setState(() {
                             currentIndex = index;
                           });
                        }),
                        child: Container(
                            margin: EdgeInsets.only(left: 10.w),
                            height: height(context) * 0.04,
                            width: width(context) * 0.19,
                            decoration: BoxDecoration(
                                color: currentIndex == index ? AppColors.c3364E0 : AppColors.cF8F7F5,
                                borderRadius:
                                BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                                  allTegList[index].toString(),
                                  style: AppTextStyles.sfProDisplay(context).copyWith(color: currentIndex == index ? AppColors.cF8F7F5: AppColors.cBlack),
                                )))
                    );
                  }),
            ),
                    SizedBox(height: 20.h,),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: FoodGridWidget(filteredDishes:filteredDishes,)
                      ),
                    ),
                  ],
                ));
          }else if(state.responseStatus == ResponseStatus.inFail){
            return const Center(child: Text("ERROR"),);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
