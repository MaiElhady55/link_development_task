import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:link_development_task/features/home/data/models/banners_model/banner.dart';
import 'package:link_development_task/features/home/data/repos/home_repo.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.homeRepo) : super(BannersInitial());

  static BannersCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;
  List<Banners> _banners = [];

  Future<void> fetchBanners() async {
    emit(BannersLoading());
    var result = await homeRepo.fetchBanners();
    result.fold((failure) {
      emit(BannersFailure(failure.errorMessage));
    }, (banners) {
      _banners = banners;
      emit(BannersSuccess(banners));
    });
  }

  void changeBannersIndex(int index) {
    if (state is BannersSuccess) {
      final currentState = state as BannersSuccess;
      if (currentState.currentIndex != index) {
        emit(BannersSuccess(_banners, currentIndex: index));
      }
    }
  }
}
