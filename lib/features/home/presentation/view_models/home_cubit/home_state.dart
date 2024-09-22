part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Banners> banners;
  final List<ProductsDatum> products;

  const HomeSuccess(this.banners, this.products);
}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure(this.errorMessage);
}

class HomeNoConnection extends HomeState {}
