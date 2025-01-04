import 'package:flutter/material.dart';
import 'package:store_app_with_api/model/products.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key,required this.products});

 final Products products;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Image.network(products.image,
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.5,
        
        ),
        SizedBox(height: 20,),
        Text(products.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),
        SizedBox(height: 15,),
        ListTile(
          leading: Text("price",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          trailing: Text("\$${products.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        SizedBox(height: 20,),
        Container(
          width: 200,
          
          child: FilledButton(onPressed: (){
          
          }, child: Text("Add to cart",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
        )
      ],
    );
  
  }
}