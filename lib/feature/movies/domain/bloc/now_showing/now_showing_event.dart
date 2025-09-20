part of 'now_showing_bloc.dart';

@freezed
abstract class NowShowingEvent with _$NowShowingEvent {
  const factory NowShowingEvent.loadNowShowing(int page) = _LoadNowShowing;
}
