import 'package:food_app/service/hive/list_hive.dart';
import 'package:food_app/utils/tools/file_importer.dart';
part 'food_event.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodState(responseStatus: ResponseStatus.pure)) {
    on<FoodGetEvent>(getAllFoods);
    on<FoodSaveEvent>(setBoxItem);
    on<FoodPriceEvent>(savePrice);
  }


  savePrice(FoodPriceEvent event, emit) async {
    await SaveBoxService.instance.addIntBox(event.price??0);
    await SaveBoxService.instance.removeIntBox(event.minusPrice??0);
    final box = await Hive.openBox('sumBox');
    if (box.isNotEmpty) {
      var hiveData = await SaveBoxService.instance.getIntBox();
      emit(state.copyWith(allPrice: hiveData ));
    }
  }


  setBoxItem(FoodSaveEvent event, emit)async{
    await SaveBoxService.instance.addToList(event.foodIndex??0);
    await SaveBoxService.instance.removeToList(event.removeIndex??0);
    final box = await Hive.openBox('list');
    if (box.isNotEmpty) {
      var hiveData = await SaveBoxService.instance.getListBox();
      emit(state.copyWith(boxList: hiveData, ));
    }
  }

  getAllFoods(event, emit) async {
    emit(state.copyWith(responseStatus: ResponseStatus.inProgress));
    MyResponse myResponse = await getIt<ApiService>().getFoods();
    final box = await Hive.openBox('list');
    final boxSum = await Hive.openBox('sumBox');
    if (box.isNotEmpty) {
      var sumData = await SaveBoxService.instance.getIntBox();
      var hiveData = await SaveBoxService.instance.getListBox();
      emit(state.copyWith(boxList: hiveData, allPrice: sumData));
    }
    if(myResponse.statusCode==200){
      emit(state.copyWith(foodsModel: FoodsModel.fromJson(myResponse.data),responseStatus: ResponseStatus.inSuccess));
    }else{
      emit(state.copyWith(responseStatus: ResponseStatus.inFail,error: myResponse.error));
    }
  }
}
