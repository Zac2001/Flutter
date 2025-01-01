import 'package:crud_with_provider/food/foot_model.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier{

  Map<String,FootModel> _foods = {};

  Map<String,FootModel> get foods => _foods;

  void addFood(String foodId,String name,double price){
    if(_foods.containsKey(foodId)){
      _foods.update(foodId, (existingItem)=> FootModel(
        id: existingItem.id,
        name: name,
        price: price,
        quantity: existingItem.quantity + 1,
        ));
    }else{
      _foods.putIfAbsent(foodId, () => FootModel(id: foodId,name: name,price: price,quantity: 1));

    }
    notifyListeners();
  }
  void removeAllFood(){
    _foods = {};
    notifyListeners();
  }

  void removeFood(String foodId){
    _foods.remove(foodId);
    notifyListeners();
  }

  void removeSingleFood(String foodId){
    if(!_foods.containsKey(foodId)){
      return;
    }
    if(_foods[foodId]!.quantity > 1){
      _foods.update(foodId, (existingItem)=>FootModel(
        id: existingItem.id,
         name: existingItem.name, 
        price: existingItem.price, 
        quantity: existingItem.quantity));
    }
    notifyListeners();
  }

  double  totalAmount(){
    double total = 0.0;
    _foods.forEach((key,value){
      total += value.price * value.quantity;
    });
    return total;
    
  }

}