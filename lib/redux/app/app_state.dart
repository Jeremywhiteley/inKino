import 'package:inkino/redux/event/event_state.dart';
import 'package:inkino/redux/show/show_state.dart';
import 'package:inkino/redux/theater/theater_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  AppState({
    @required this.searchQuery,
    @required this.theaterState,
    @required this.showState,
    @required this.eventState,
  });

  final String searchQuery;
  final TheaterState theaterState;
  final ShowState showState;
  final EventState eventState;

  factory AppState.initial() {
    return new AppState(
      searchQuery: null,
      theaterState: new TheaterState.initial(),
      showState: new ShowState.initial(),
      eventState: new EventState.initial(),
    );
  }

  AppState copyWith({
    String searchQuery,
    TheaterState theaterState,
    ShowState showState,
    EventState eventState,
  }) {
    return new AppState(
      searchQuery: searchQuery ?? this.searchQuery,
      theaterState: theaterState ?? this.theaterState,
      showState: showState ?? this.showState,
      eventState: eventState ?? this.eventState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState &&
              runtimeType == other.runtimeType &&
              searchQuery == other.searchQuery &&
              theaterState == other.theaterState &&
              showState == other.showState &&
              eventState == other.eventState;

  @override
  int get hashCode =>
      searchQuery.hashCode ^
      theaterState.hashCode ^
      showState.hashCode ^
      eventState.hashCode;
}
