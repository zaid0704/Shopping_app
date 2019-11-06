import 'package:flutter/material.dart';
class Product with ChangeNotifier{
  @required String id; 
  @required String title;
  @required String description;
  @required double price;
  @required String imageUrl;
  @required bool isFav = false;
  Product({this.id,this.title,this.description,this.price,this.imageUrl,this.isFav});
  void toggleFav(){
    isFav=!isFav;
    notifyListeners();
  }
}