import 'package:crud_with_provider/food/food_cart_screen.dart';
import 'package:crud_with_provider/food/food_data.dart';
import 'package:crud_with_provider/food/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodItemScreen extends StatelessWidget {
  const FoodItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> FoodCartScreen()));
          }, icon: Icon(Icons.shopping_cart),),
        ],
      ),
     body: ListView.builder(
      itemCount: FOOD.length,
      itemBuilder: (ctx,snapshot)=>Card(
        child: ListTile(
          title: Text(FOOD[snapshot]["name"] as String,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          subtitle: Text("\$${FOOD[snapshot]["price"]}" ,style: TextStyle(fontSize: 15),),
          trailing: IconButton(onPressed: (){
              Provider.of<FoodProvider>(context,listen: false).addFood(
                FOOD[snapshot]["id"] as String, 
                FOOD[snapshot]["name"] as String, 
                FOOD[snapshot]["price"] as double);
          }, icon: Icon(Icons.add)),
        ),
      )),
    );
  }
}