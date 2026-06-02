part of 'explore_bloc.dart';

class ExploreState extends Equatable {
  const ExploreState({
    required this.mapType,
  });

  factory ExploreState.initial() =>
      const ExploreState(mapType: MapType.openStreetMap);

  final MapType mapType;

  @override
  List<Object?> get props => [mapType];
}
