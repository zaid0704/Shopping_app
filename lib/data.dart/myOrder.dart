import 'package:flutter/material.dart';

class OrderModel {
 
  String title ;
  String description;
  double price;
  String url ;
  

  OrderModel({this.title,this.price,this.description,this.url});
}
class MyOrder with ChangeNotifier {
  final listOrder =[];
  void addOrder(OrderModel newOrder){
    listOrder.add(newOrder);
    notifyListeners();
  }
  List<OrderModel> get item{
    return [...listOrder];
  }
}