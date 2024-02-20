part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<Map<String,dynamic>> banners;
  final List<Map<String,dynamic>> products;
  final List<Map<String,dynamic>> mainShortCuts;

  HomeLoaded(this.banners, this.mainShortCuts, this.products);
}

final class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

