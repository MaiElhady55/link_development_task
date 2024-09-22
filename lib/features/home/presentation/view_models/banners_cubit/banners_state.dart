part of 'banners_cubit.dart';

sealed class BannersState extends Equatable {
  const BannersState();

  @override
  List<Object> get props => [];
}

final class BannersInitial extends BannersState {}

class BannersLoading extends BannersState {}

class BannersFailure extends BannersState {
  final String errMessage;

  const BannersFailure(this.errMessage);
}

class BannersSuccess extends BannersState {
  final List<Banners> banners;
  final int currentIndex;

  const BannersSuccess(this.banners, {this.currentIndex = 0});

  @override
  List<Object> get props => [banners, currentIndex];
}

class BannersChangeIndexState extends BannersState {}
