import 'package:crud_with_provider/drink/drink_model.dart';
import 'package:flutter/material.dart';

class DrinkProvider extends ChangeNotifier{

  List<DrinkModel> _drinks = [];

  List<DrinkModel> get drinks => _drinks;

  void addDrink(String id,String name){
    _drinks.add(DrinkModel(id: id,name: name));
    
    notifyListeners();
  }  

  void removeDrinks(String drinkId){
    // _drinks.removeWhere((element) => element.id == drinkId);
    _drinks.remove(_drinks[_drinks.indexWhere((element) => element.id == drinkId)]);
    notifyListeners();
  }

  
}