import 'package:food_app/utils/tools/form_status.dart';
import '../../data/models/category_model.dart';
// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';
// ignore: must_be_immutable
class CategoryState extends Equatable{
  ResponseStatus responseStatus;
  String? error;
  CategoryModel? categoryModel;
  CategoryState({required this.responseStatus, this.error, this.categoryModel});

  copyWith({ResponseStatus? responseStatus, String? error,CategoryModel? categoryModel}){
    return CategoryState(
       responseStatus: responseStatus?? this.responseStatus,
       error: error?? this.error,
       categoryModel: categoryModel??this.categoryModel,

    );
  }


  @override
  List<Object?> get props => [responseStatus,error,categoryModel];
}

