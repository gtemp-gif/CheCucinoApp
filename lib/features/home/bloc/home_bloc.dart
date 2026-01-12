import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeEvent>(_onLoadHome);
  }

  Future<void> _onLoadHome(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      // Replace with actual data fetching
      await Future.delayed(const Duration(seconds: 1));
      final recipes = [
        const Recipe(
          id: '1',
          title: 'Spaghetti with Fresh Tomato',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAH4PXBU7JgKQ7jI3LZlgFo4S5P1G1lILHSgVbfd-osJkE_IBmR5z0PKo1sqRLEN16gUpl8ZL1beyBTNqBvzv8yiShHOGlQbrWwY7t6gjOndd44lEHf-AhuC4TCig6wUq75IonXpCcuMUviPT_BrgYL7cMJJ4FuuQoP2Dj__TkN8_7sJila2NgEn4Y3v8LNJB-e24hPFJxdhmZjWPg_NlgzU8GJmQd10VolAEZaYb6VutPfagIujUxtdRv0aC5o3G7YZLOqceAvug',
          tags: ['Fast', '15 min', '450 kcal', 'Anti-waste'],
        ),
        const Recipe(
          id: '2',
          title: 'Quinoa and Avocado Salad',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDpK_6kgz4f2TTexx-qLFDEMJjAAMimROENwTWsAHYo1GKKI2wPhNwXT1eLSMhFOYsFjwXdS3Mhhh2BRCLg4Mp6nIe7pSgfq34742gKieP7VqGOxk2WHCqga29OnJYWz0nb9vWkT_jwR_2RSFVfsRbEzqOftHHYBjMpv4RptEBTZIkXVzkq5ErYwBwvgUhfcWqrjbQUAy6rh-MdfJzvnNH2_wBUIkHh0m1fWM8MYOA1ERhMcduav-o1KPEMWjynue15ow1Mi0vdHQ',
          tags: ['Healthy', '20 min', '320 kcal'],
        ),
      ];
      emit(state.copyWith(status: HomeStatus.success, recipes: recipes));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
