import 'package:food_app/bloc/tab_box_bloc/tab_box_state.dart';
import '../../app/app.dart';
part 'tab_box_event.dart';

class TabBoxBloc extends Bloc<ChangeIndexEvent, TabBoxState> {
  TabBoxBloc() : super(TabBoxState(0)) {
    on<ChangeIndexEvent>(changeIndex);
  }

  changeIndex(ChangeIndexEvent event, emit) {
    emit(state.copyWith(event.index));
  }
}
