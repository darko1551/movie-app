import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';
part 'bottom_navigation_bloc.freezed.dart';

@singleton
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(_BottomNavigationState(0)) {
    on<_ChangeTab>((event, emit) => emit(_BottomNavigationState(event.index)));
  }
}
