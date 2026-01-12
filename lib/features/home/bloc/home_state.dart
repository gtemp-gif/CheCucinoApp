part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.recipes = const [],
  });

  final HomeStatus status;
  final List<Recipe> recipes;

  HomeState copyWith({
    HomeStatus? status,
    List<Recipe>? recipes,
  }) {
    return HomeState(
      status: status ?? this.status,
      recipes: recipes ?? this.recipes,
    );
  }

  @override
  List<Object> get props => [status, recipes];
}

class Recipe extends Equatable {
  const Recipe({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.tags,
  });

  final String id;
  final String title;
  final String imageUrl;
  final List<String> tags;

  @override
  List<Object> get props => [id, title, imageUrl, tags];
}
