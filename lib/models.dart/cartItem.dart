import 'package:flutter/material.dart';
class  CartModel{
  String id ;
  String title;
  double price ;
  String imageUrl;
  String description;
  int quantity = 1;
  CartModel(this.id,this.title,this.price,this.imageUrl,this.description);
}