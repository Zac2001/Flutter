import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_with_api/dio/product_service.dart';
import 'package:store_app_with_api/model/products.dart';
import 'package:store_app_with_api/state/product_list_state.dart';


class ProductListNotifer extends Notifier<ProductListState>{

  final ProductService _productService = ProductService();
  @override
  ProductListState build() {
    
    return ProductListLoading();
  }

  void getAllProducts() async{
    try{
      state = ProductListLoading();
      final List<Products> products = await _productService.getProducts();
      state = ProductListSuccess(products);
    }catch(e){
        state = ProductListError(e.toString());
    }
  }


}