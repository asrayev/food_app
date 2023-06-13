import 'package:food_app/data/models/category_model.dart';
import 'package:food_app/utils/tools/file_importer.dart';
import 'category_state.dart';
part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState(responseStatus: ResponseStatus.pure)) {
    on<CategoryEvent>(getAllCategory);
  }

  getAllCategory(event, emit) async {
    emit(state.copyWith(responseStatus: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<ApiService>().getCategory();
    if(myResponse.statusCode==200){
      emit(state.copyWith(categoryModel: CategoryModel.fromJson(myResponse.data),responseStatus: ResponseStatus.inSuccess));
    }else{
      emit(state.copyWith(responseStatus: ResponseStatus.inFail,error: myResponse.error));

    }
  }
}
