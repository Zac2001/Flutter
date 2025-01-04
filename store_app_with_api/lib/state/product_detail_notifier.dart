import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_with_api/dio/product_service.dart';
import 'package:store_app_with_api/state/product_detail_state.dart';

class ProductDetailNotifier extends AutoDisposeNotifier<ProductDetailState>{

  final ProductService productService = ProductService();
  @override
  ProductDetailState build() {
    return ProductDetailLoadingState();
  }

  Future<void> getProductDetail(int id)async{
    try{
      state = ProductDetailLoadingState();
      final productDetail = await productService.getProduct(id);
      state = ProductDetailSuccessState(productDetail);
    }catch(e){
      state = ProductDetailErrorState(e.toString());
    }
  }
}