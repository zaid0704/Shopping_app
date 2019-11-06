import 'package:flutter/material.dart';
import '../models.dart/cartItem.dart';
class Carts with ChangeNotifier{
  List<CartModel> carts = [];
  void addItem(CartModel newCart){
    bool duplicate = false;
    carts.forEach((f){
      if(f.title == newCart.title){
        duplicate=true;
        f.quantity++;
        notifyListeners();
      }
    });
    if(duplicate){
      
    }
    else{
    carts.add(newCart);}
    print(newCart.title);
    notifyListeners();
  }
  int get lenght{
    return carts.length;
  }
  List<CartModel> get item {
    return [...carts];
  }

  double get grandTotal{
    double total = 0.0;
    carts.forEach((f){
      total  +=(f.price * f.quantity);
    });
   
    return total;
  }
  void deleteItem(String title ){
   
    carts.removeWhere((test){
      return test.title==title;
    });
     notifyListeners();
  }
}