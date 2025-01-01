// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:crud_with_provider/food/food_provider.dart';

class FoodCartScreen extends StatelessWidget {
  const FoodCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<FoodProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Order"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
            child: Row(
              children: [
                Text("Total",style: TextStyle(fontSize: 20),),
                Spacer(),
                Chip(label: Text("\$${cart.totalAmount().toStringAsFixed(2)}",
                style: TextStyle(color: Colors.white,fontSize: 15),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                ),
                TextButton(onPressed: (){
        
                }, child: Text("Order Now"),),
              ],
            ),  
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.foods.length,
                itemBuilder: (context, index) =>CardItemWidget(
                  id: cart.foods.values.toList()[index].id, 
                  name: cart.foods.values.toList()[index].name, 
                  foodId: cart.foods.keys.toList()[index], 
                  price: cart.foods.values.toList()[index].price, 
                  quantity: cart.foods.values.toList()[index].quantity)),
            )
        
          ],
        ),
      ),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.foodId,
    required this.price,
    required this.quantity,
  }) : super(key: key);
  final String id;
  final String name;
  final String foodId;
  final double price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      
      key: ValueKey(id), 
      background: Container(
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 15)
    ),
     direction: DismissDirection.endToStart,
     
     onDismissed: (direction) {
      Provider.of<FoodProvider>(context,listen: false).removeFood(id);
    },
    
     child: Card(
      margin: EdgeInsets.symmetric(vertical: 4,horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text("\$${price}",style: TextStyle(fontSize: 20),),
              ),
              ),
          ),
          title: Text(name),
          subtitle: Text("\$${(price * quantity).toStringAsFixed(2)}",
          style: TextStyle(fontSize: 20),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){
                  Provider.of<FoodProvider>(context,listen: false).removeSingleFood(foodId);
              }, icon: Icon(Icons.remove)),
              Text("$quantity",style: TextStyle(fontSize: 20),),
              IconButton(onPressed: (){
                  Provider.of<FoodProvider>(context,listen: false).addFood(foodId, name, price);
              }, icon: Icon(Icons.add)),
            ],
          ),
        ),
        ),
     ),
    );
    
  }
}
