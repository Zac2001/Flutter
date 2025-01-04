import 'package:store_app_with_api/model/products.dart';

sealed class ProductDetailState {}

class ProductDetailLoadingState extends ProductDetailState {}

class ProductDetailSuccessState extends ProductDetailState {
  final Products products;

  ProductDetailSuccessState(this.products);
}

class ProductDetailErrorState extends ProductDetailState {

  final String error;

  ProductDetailErrorState(this.error);
}