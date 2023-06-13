import '../../../../utils/tools/file_importer.dart';
import '../../widget/home_appbar.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body:  BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if(state.responseStatus == ResponseStatus.inProgress){
            return const FoodsShimmerWidget();
          }else if(state.responseStatus == ResponseStatus.inSuccess){
            FoodsModel categoryModel = state.foodsModel!;
            return SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: height(context)*0.7,
                      child: Column(
                        children: [
                          SizedBox(height: 20.h,),
                          Expanded(
                            child: ListView.builder(
                                itemCount: categoryModel.dishes!.length,
                                itemBuilder: (context, index){
                              return state.boxList!.contains(categoryModel.dishes![index].id!) ?  SizedBox(
                                  height: height(context)*0.14,
                                  child: Padding(
                                    padding: EdgeInsets.all( 10.w),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height(context)*0.14,
                                          width: width(context)*0.25,
                                          decoration: BoxDecoration(
                                            color: AppColors.cF8F7F5,
                                            borderRadius: BorderRadius.circular(10.r),
                                            image: DecorationImage(image: NetworkImage(categoryModel.dishes![index].imageUrl!))
                                          ),
                                        ),
                                        SizedBox(width: 10.w,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          Text(categoryModel.dishes![index].name!, style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w600),maxLines: 2,textAlign: TextAlign.center,),
                                          SizedBox(height: 5.h,),
                                          SizedBox(
                                            width: width(context)*0.4,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("${categoryModel.dishes![index].price.toString()} ₽", style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w500),maxLines: 1,textAlign: TextAlign.center,),
                                                Text(" . ${categoryModel.dishes![index].weight.toString()} г", style: AppTextStyles.sfProDisplay(context, fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.grey),maxLines: 1,textAlign: TextAlign.center,),
                                              ],
                                            ),
                                          ),

                                        ],),
                                        Container(
                                          height: height(context)*0.04,
                                          width: width(context)*0.2,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15.r),
                                            color: AppColors.cEFEEEC
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(width: 5.w,),
                                              GestureDetector(
                                                  onTap: ((){
                                                    context.read<FoodBloc>().add(FoodSaveEvent(removeIndex: categoryModel.dishes![index].id));
                                                    context.read<FoodBloc>().add(FoodPriceEvent(minusPrice: categoryModel.dishes![index].price));
                                                  }),
                                                  child: SvgPicture.asset(AppIcons.minus, height: 24.h,)),
                                              const Spacer(),
                                              Text(state.boxList!.where((element) => element == categoryModel.dishes![index].id!).length.toString(), style: AppTextStyles.sfProDisplay(context, fontWeight: FontWeight.w600, fontSize: 18.sp),),
                                              const Spacer(),
                                              GestureDetector(
                                                  onTap: ((){
                                                    context.read<FoodBloc>().add(FoodSaveEvent(foodIndex: categoryModel.dishes![index].id));
                                                    context.read<FoodBloc>().add(FoodPriceEvent(price: categoryModel.dishes![index].price));
                                                  }),
                                                  child: SvgPicture.asset(AppIcons.plus, height: 24.h,)),
                                              SizedBox(width: 5.w,),
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  )) : const SizedBox();
                            }),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: ((){
                      }),
                      child: Container(height: height(context)*0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: state.allPrice == null || state.allPrice==0 ?  AppColors.cA5A9B2 :AppColors.c3364E0,
                      ),

                      width: width(context)*0.9,
                      child: Center(
                        child: Text("Оплатить ${state.allPrice??0} ₽", style: AppTextStyles.sfProDisplay(context, color: AppColors.cWhite),),
                      ),),
                    )
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
