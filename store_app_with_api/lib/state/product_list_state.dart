import 'package:store_app_with_api/model/products.dart';

sealed class ProductListState {}


class ProductListLoading extends ProductListState {}

class ProductListSuccess extends ProductListState{
  final List<Products> products;
  ProductListSuccess(this.products);
}

class ProductListError extends ProductListState{
  final String error;
  ProductListError(this.error);
}