import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:link_development_task/features/home/data/models/products_model/products_datum.dart';
import 'package:link_development_task/features/home/data/repos/home_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    var result = await homeRepo.fetchProducts();
    result.fold((failure) {
      emit(ProductsFailure(failure.errorMessage));
    }, (products) {
      emit(ProductsSuccess(products));
    });
  }
}
