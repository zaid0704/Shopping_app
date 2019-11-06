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
    //print(newCart.title);
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
  void undo(String title){
    print(title);
    carts.forEach((test){
      
      if(test.title==title)
       {
         print('Yours undo is $title');
         if(test.quantity>=2)
          {
            test.quantity--;
          }
         else if(test.quantity==1)
           {
             carts.removeWhere((t){
               return t.title==test.title;
             });
           }
       }
    });
    notifyListeners();
  }
}