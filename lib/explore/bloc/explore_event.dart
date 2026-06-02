part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object?> get props => [];
}

class ChangeMapTypeEvent extends ExploreEvent {
  const ChangeMapTypeEvent(this.mapType);

  final MapType mapType;

  @override
  List<Object?> get props => [mapType];
}
