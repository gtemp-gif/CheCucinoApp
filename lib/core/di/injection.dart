import 'package:che_cucino/features/navigation/bloc/navigation_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupDependencies() {
  // Qui registrerai bloc, repository, service
   sl.registerFactory<NavigationBloc>(() => NavigationBloc());
}
