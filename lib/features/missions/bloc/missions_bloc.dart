import 'package:bloc/bloc.dart';
import 'package.equatable/equatable.dart';

part 'missions_event.dart';
part 'missions_state.dart';

class MissionsBloc extends Bloc<MissionsEvent, MissionsState> {
  MissionsBloc() : super(const MissionsState()) {
    on<LoadMissions>(_onLoadMissions);
    on<AddMission>(_onAddMission);
  }

  void _onLoadMissions(
    LoadMissions event,
    Emitter<MissionsState> emit,
  ) {
    // Replace with actual data loading
    const missions = [
      Mission(
        id: '1',
        title: 'Veg Week',
        subtitle: 'Replace meat with legumes in 3 dinners.',
        reward: '2/3 meals',
        isInProgress: true,
      ),
      Mission(
        id: '2',
        title: 'Save the Bread',
        subtitle: 'Use stale bread in 2 creative recipes this week.',
        reward: 'Save ~€5',
      ),
      Mission(
        id: '3',
        title: 'Empty Fridge',
        subtitle: 'Cook a meal using only ingredients that are about to expire.',
        reward: 'Zero waste',
      ),
    ];
    emit(state.copyWith(status: MissionsStatus.success, missions: missions));
  }

  void _onAddMission(
    AddMission event,
    Emitter<MissionsState> emit,
  ) {
    final missions = List<Mission>.from(state.missions)..add(event.mission);
    emit(state.copyWith(missions: missions));
  }
}
