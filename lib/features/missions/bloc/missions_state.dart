part of 'missions_bloc.dart';

enum MissionsStatus { initial, loading, success, failure }

class MissionsState extends Equatable {
  const MissionsState({
    this.status = MissionsStatus.initial,
    this.missions = const [],
  });

  final MissionsStatus status;
  final List<Mission> missions;

  MissionsState copyWith({
    MissionsStatus? status,
    List<Mission>? missions,
  }) {
    return MissionsState(
      status: status ?? this.status,
      missions: missions ?? this.missions,
    );
  }

  @override
  List<Object> get props => [status, missions];
}

class Mission extends Equatable {
  const Mission({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.reward,
    this.isInProgress = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final String reward;
  final bool isInProgress;

  @override
  List<Object> get props => [id, title, subtitle, reward, isInProgress];
}
