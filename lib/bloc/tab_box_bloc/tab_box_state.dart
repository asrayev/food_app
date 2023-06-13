// ignore: depend_on_referenced_packages
import  'package:equatable/equatable.dart';


// ignore: must_be_immutable
class TabBoxState extends Equatable{
  int index;

  TabBoxState(this.index);

  copyWith(int? index)=>TabBoxState(index??this.index);

  @override
  List<Object?> get props => [index];


}

