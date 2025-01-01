import 'package:crud_with_provider/drink/drink_cart_screen.dart';
import 'package:crud_with_provider/drink/drink_data.dart';
import 'package:crud_with_provider/drink/drink_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrinkItemScreen extends StatelessWidget {
  const DrinkItemScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Drinks"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>DrinkCartScreen()));
          }, icon: Icon(Icons.shopping_cart),),
        ],
      ),
      body: ListView.builder(
        itemCount: DRINK.length,
        itemBuilder: (context, index) =>Card(
          child: ListTile(
            title: Text(DRINK[index]),
            trailing: IconButton(onPressed: (){
              // ignore: unnecessary_cast
              Provider.of<DrinkProvider>(context, listen: false).addDrink(DRINK[index], DRINK[index]);
            }, icon: Icon(Icons.add),),
          ),
        ),
      ),
    );
  }
}