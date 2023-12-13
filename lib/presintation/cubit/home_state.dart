part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CurrentChange extends HomeState {
  final int index;
  CurrentChange({required this.index});
}

class IsSelect extends HomeState {
  final bool isChange;
  IsSelect({required this.isChange});
}
