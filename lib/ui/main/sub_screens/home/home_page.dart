import 'package:food_app/ui/main/sub_screens/home/sub_screens/foods_screen.dart';
import 'package:food_app/utils/tools/file_importer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body:
    BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if(state.responseStatus == ResponseStatus.inProgress){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state.responseStatus == ResponseStatus.inSuccess){
          CategoryModel categoryModel = state.categoryModel!;
          return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                    itemCount: categoryModel.categories.length,
                    itemBuilder: (context, index){
                  return CategoryItemWidget(onTap: ((){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AllFoodsScreen()));

                  }),name: categoryModel.categories[index].name,imageUrl: categoryModel.categories[index].imageUrl,);
                }),
              ));
        }else if(state.responseStatus == ResponseStatus.inFail){
          return const Center(child: Text("ERROR"),);
        }
        return const SizedBox();
      },
    )
    );
  }
}
