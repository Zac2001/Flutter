import 'package:flutter/material.dart';

import 'package:store_app_with_api/model/products.dart';
import 'package:store_app_with_api/ui/details.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key, required this.products});

  final List<Products> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Get.to(DetailsScreen(id: products[index].id));
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsScreen(id: products[index].id)));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Card(
              color: Colors.white,
              child: GridTile(
                footer: Row(
                  children: [
                    Text("\$${products[index].price}",style: TextStyle(fontSize: 20),)
                    
                    ],
                ),
                child: Image.network(
                  products[index].image,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
