import 'package:food_app/data/models/food_model.dart';
import 'package:food_app/utils/tools/form_status.dart';
import '../../data/models/category_model.dart';
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
// ignore: must_be_immutable
class FoodState extends Equatable{
  ResponseStatus responseStatus;
  String? error;
  FoodsModel? foodsModel;
  FoodState({required this.responseStatus, this.error, this.foodsModel});

  copyWith({ResponseStatus? responseStatus, String? error,FoodsModel? foodsModel}){
    return FoodState(
      responseStatus: responseStatus?? this.responseStatus,
      error: error?? this.error,
      foodsModel: foodsModel??this.foodsModel,

    );
  }


  @override
  List<Object?> get props => [responseStatus,error,foodsModel];
}

