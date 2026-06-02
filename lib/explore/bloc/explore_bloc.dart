import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unfog/models/map_type.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreState.initial()) {
    on<ChangeMapTypeEvent>(_onChangeMapType);
  }

  Future<void> _onChangeMapType(
    ChangeMapTypeEvent event,
    Emitter<ExploreState> emit,
  ) async {
    emit(ExploreState(mapType: event.mapType));
  }
}
