import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_app_with_api/model/products.dart';
import 'package:store_app_with_api/state/product_detail_notifier.dart';
import 'package:store_app_with_api/state/product_detail_state.dart';
import 'package:store_app_with_api/widgets/detail_widget.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key,required this.id});

  final int id;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}


class _DetailsScreenState extends ConsumerState<DetailsScreen> {




  final productDetailProvider = AutoDisposeNotifierProvider<ProductDetailNotifier, ProductDetailState>(
    ()=> ProductDetailNotifier());

    ProductDetailNotifier? productDetailNotifier;

    @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productDetailNotifier?.getProductDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    productDetailNotifier = ref.read(productDetailProvider.notifier);
    final productDetailState = ref.watch(productDetailProvider);
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("DetailScreen"),
        centerTitle: true,
      ),
      body: switch(productDetailState){

        
        
        ProductDetailLoadingState() => Center(child: CircularProgressIndicator()),
       
        ProductDetailSuccessState(products: Products product) => DetailWidget(products: product,),
        
        ProductDetailErrorState(error : String error) => Center(child: Text(error),),
      }
    );
  }
}