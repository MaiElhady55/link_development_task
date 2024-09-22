import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:link_development_task/core/errors/failures.dart';
import 'package:link_development_task/core/network/remote/api_constance.dart';
import 'package:link_development_task/core/network/remote/api_service.dart';
import 'package:link_development_task/features/home/data/models/banners_model/banner.dart';
import 'package:link_development_task/features/home/data/models/banners_model/banners_model.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_datum.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_model.dart';
import 'package:link_development_task/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<Banners>>> fetchBanners() async {
    try {
      Response response =
          await apiService.getData(endPoint: ApiConstance.banners);
      if (response.statusCode == 200 && response.data != null) {
        BannersModel bannersModel = BannersModel.fromJson(response.data);
        if (bannersModel.data?.banners != null) {
          return right(bannersModel.data!.banners!);
        } else {
          return left(ServerFailure('No banners found in response'));
        }
      } else {
        return left(
            ServerFailure('Unexpected status code: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductsDatum>>> fetchProducts() async {
    try {
      Response response =
          await apiService.getData(endPoint: ApiConstance.products);
      if (response.statusCode == 200 && response.data != null) {
        ProductsModel productsModel = ProductsModel.fromJson(response.data);
        if (productsModel.data?.datum != null) {
          return right(productsModel.data!.datum!);
        } else {
          return left(ServerFailure('No products found in response'));
        }
      } else {
        return left(
            ServerFailure('Unexpected status code: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
