import 'package:food_app/utils/tools/file_importer.dart';
part 'food_event.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodState(responseStatus: ResponseStatus.pure)) {
    on<FoodEvent>(getAllFoods);
  }

  getAllFoods(event, emit) async {
    emit(state.copyWith(responseStatus: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<ApiService>().getFoods();
    if(myResponse.statusCode==200){
      emit(state.copyWith(foodsModel: FoodsModel.fromJson(myResponse.data),responseStatus: ResponseStatus.inSuccess));
    }else{
      emit(state.copyWith(responseStatus: ResponseStatus.inFail,error: myResponse.error));
    }
  }
}
