import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:link_development_task/features/home/data/models/banners_model/banner.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_datum.dart';
import 'package:link_development_task/features/home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      emit(HomeNoConnection());
      return;
    }
    try {
      var bannersResult = await homeRepo.fetchBanners();
      var productsResult = await homeRepo.fetchProducts();

      connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(HomeNoConnection());
        return;
      }

      if (bannersResult.isLeft() || productsResult.isLeft()) {
        emit(const HomeFailure('حدث خطأ أثناء تحميل البيانات'));
      } else {
        final banners = bannersResult.getOrElse(() => []);
        final products = productsResult.getOrElse(() => []);
        emit(HomeSuccess(banners, products));
      }
    } catch (e) {
      emit(HomeFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }

  Future<void> retryLoading() async {
    emit(HomeLoading());
    await loadHomeData();
  }
}
