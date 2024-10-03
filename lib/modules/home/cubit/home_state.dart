part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoadError extends HomeState {
  final String error;

 const HomeLoadError({required this.error});
  @override
  List<Object> get props => [error];
}


final class HomeLoaded extends HomeState {
  final List<ImageModel> images;

  const HomeLoaded({required this.images});

  @override
  List<Object> get props => [images];
}



