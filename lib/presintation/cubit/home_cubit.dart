import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/models/notes.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  int index = 0;
  bool isSelect = false;
  List<Notes> _note = [];

  change(int current) {
    index = current;
    emit(CurrentChange(index: current));
  }

  isChangeSelect(bool value) {
    isSelect = value;
    emit(IsSelect(isChange: value));
  }

  addTask(Notes notes) {
    _note.add(notes);
    emit(NoteLoading(note: _note));
  }

  removeTask(Notes notes) {
    _note.remove(notes);
    emit(NoteLoading(note: _note));
  }
}
