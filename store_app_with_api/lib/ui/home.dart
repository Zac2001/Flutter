import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_with_api/model/products.dart';
import 'package:store_app_with_api/state/product_list_notifer.dart';
import 'package:store_app_with_api/state/product_list_state.dart';
import 'package:store_app_with_api/widgets/product_error.dart';
import 'package:store_app_with_api/widgets/product_list.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  final productListNotifierProvider = NotifierProvider<ProductListNotifer,ProductListState>(
    () => ProductListNotifer(),
  );

  ProductListNotifer? productListNotifer;

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productListNotifer?.getAllProducts();
    },);
  }
  
  @override
  Widget build(BuildContext context) {
     productListNotifer = ref.read(productListNotifierProvider.notifier);
    final productListState = ref.watch(productListNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: switch(productListState){
        
        ProductListLoading() => const Center(child: CircularProgressIndicator(),),
   
        ProductListSuccess(products : List<Products> product) => ProductList(products: product),
   
        ProductListError(error: String error) => ProductError(error: error),
      }
    );
  }
}