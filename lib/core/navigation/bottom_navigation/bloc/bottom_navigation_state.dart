part of 'bottom_navigation_bloc.dart';

@freezed
abstract class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState(int index) = _BottomNavigationState;
}
