import 'package:dartz/dartz.dart';
import 'package:link_development_task/core/errors/failures.dart';
import 'package:link_development_task/features/home/data/models/banners_model/banner.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_datum.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Banners>>> fetchBanners();
  Future<Either<Failure, List<ProductsDatum>>> fetchProducts();
}
