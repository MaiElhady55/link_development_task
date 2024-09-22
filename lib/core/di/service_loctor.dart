import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:link_development_task/core/network/remote/api_service.dart';
import 'package:link_development_task/features/home/data/repos/home_repo.dart';
import 'package:link_development_task/features/home/data/repos/home_repo_impl.dart';
import 'package:link_development_task/features/home/presentation/view_models/banners_cubit/banners_cubit.dart';
import 'package:link_development_task/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:link_development_task/features/home/presentation/view_models/products_cubit/products_cubit.dart';
import 'package:link_development_task/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
 //Dio
  getIt.registerSingleton<Dio>(Dio());

 //ApiService
  getIt.registerSingleton<ApiService>(
    ApiService(getIt<Dio>()),
  );

  //Repo
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(getIt<ApiService>()),
  );

  //Repo Impl
  getIt.registerSingleton<HomeRepo>(getIt<HomeRepoImpl>());

  //Cubits
  getIt.registerFactory(() => BannersCubit(getIt<HomeRepo>()));
  getIt.registerFactory(() => HomeCubit(getIt<HomeRepo>()));
  getIt.registerFactory(() => ProductsCubit(getIt<HomeRepo>()));
  getIt.registerFactory(() => LayoutCubit());
}
