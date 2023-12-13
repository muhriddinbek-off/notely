import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int index = 0;
  bool isSelect = false;

  change(int current) {
    index = current;
    emit(CurrentChange(index: current));
  }

  isChangeSelect(bool value) {
    isSelect = value;
    emit(IsSelect(isChange: value));
  }
}
