import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc
    extends Bloc<NavigationEvent, NavigationPage> {
  NavigationBloc() : super(NavigationPage.home) {
    on<GoHome>((_, emit) => emit(NavigationPage.home));
    on<GoProfile>((_, emit) => emit(NavigationPage.profile));
    on<GoSettings>((_, emit) => emit(NavigationPage.settings));
  }
}
