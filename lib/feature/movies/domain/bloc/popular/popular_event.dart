part of 'popular_bloc.dart';

@freezed
abstract class PopularEvent with _$PopularEvent {
  const factory PopularEvent.loadPopular(int page) = _LoadPopular;
}
