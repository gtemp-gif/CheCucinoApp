part of 'missions_bloc.dart';

abstract class MissionsEvent extends Equatable {
  const MissionsEvent();

  @override
  List<Object> get props => [];
}

class LoadMissions extends MissionsEvent {}

class AddMission extends MissionsEvent {
  const AddMission(this.mission);

  final Mission mission;

  @override
  List<Object> get props => [mission];
}
