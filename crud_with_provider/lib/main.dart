import 'package:crud_with_provider/drink/drink_item_screen.dart';
import 'package:crud_with_provider/drink/drink_provider.dart';
import 'package:crud_with_provider/food/food_item_screen.dart';
import 'package:crud_with_provider/food/food_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (ctx) =>DrinkProvider(),
        ),
      ChangeNotifierProvider(
        create: (ctx) => FoodProvider(),  
        ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodItemScreen(),
      // DrinkItemScreen(),
    ),
    );
     
  }
}