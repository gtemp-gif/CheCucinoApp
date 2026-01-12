import 'package:che_cucino/features/auth/bloc/auth_bloc.dart';
import 'package:che_cucino/features/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerSingleton<AuthBloc>(AuthBloc());
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
}
