import 'package:dio/dio.dart';
import 'package:store_app_with_api/api/api_service.dart';
import 'package:store_app_with_api/model/products.dart';

class ProductService {

  final Dio  _dio = Dio();

  Future<List<Products>> getProducts() async {
    Uri uri = Uri.parse("${ApiService.baseUrl}${ApiService.getAllProducts}");
    final response = await _dio.getUri(uri);
    
    return(response.data as List)
    .map((e)=> Products.fromMap(e)).toList();
  }

  Future<Products> getProduct(int id) async {
    Uri uri =Uri.parse("${ApiService.baseUrl}${ApiService.getAllProducts}/$id");
    final response = await _dio.getUri(uri);
    return Products.fromMap(response.data);
  }
}