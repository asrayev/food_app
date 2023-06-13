part of 'food_bloc.dart';


abstract class FoodEvent {}

class FoodGetEvent extends FoodEvent{}

class FoodPriceEvent extends FoodEvent{
  int? price;
  int? minusPrice;
  FoodPriceEvent({this.price, this.minusPrice});
}

class FoodSaveEvent extends FoodEvent{
  int? foodIndex;
  int? removeIndex;
  FoodSaveEvent({this.foodIndex, this.removeIndex});
}

