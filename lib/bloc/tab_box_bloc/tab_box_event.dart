part of 'tab_box_bloc.dart';


abstract class TabBoxEvent {}

class ChangeIndexEvent extends TabBoxEvent{
  int index;

  ChangeIndexEvent(this.index);
}
