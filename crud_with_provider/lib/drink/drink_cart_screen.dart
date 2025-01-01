import 'package:crud_with_provider/drink/drink_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinkCartScreen extends StatelessWidget {
  const DrinkCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drink = Provider.of<DrinkProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Drink Order"),
        centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: drink.drinks.length ,
        itemBuilder: (ctx,index)=>Card(
          child: ListTile(
            title: Text(drink.drinks[index].name),
            trailing: IconButton(onPressed: (){
                Provider.of<DrinkProvider>(context, listen: false).removeDrinks(drink.drinks[index].id);
            }, icon: Icon(Icons.delete),),
          ),
        ),
        ),
    );
  }
}