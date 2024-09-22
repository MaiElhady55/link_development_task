part of 'products_cubit.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  final String errMessage;

  const ProductsFailure(this.errMessage);
}

class ProductsSuccess extends ProductsState {
  final List<ProductsDatum> products;

  const ProductsSuccess(this.products);
}
