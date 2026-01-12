import 'package:che_cucino/features/auth/bloc/auth_bloc.dart';
import 'package:che_cucino/features/home/bloc/home_bloc.dart';
import 'package:che_cucino/features/missions/bloc/missions_bloc.dart';
import 'package:che_cucino/features/shopping_list/bloc/shopping_list_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerSingleton<AuthBloc>(AuthBloc());
  getIt.registerFactory<HomeBloc>(() => HomeBloc());
  getIt.registerFactory<ShoppingListBloc>(() => ShoppingListBloc());
  getIt.registerFactory<MissionsBloc>(() => MissionsBloc());
}
