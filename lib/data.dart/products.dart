import 'package:flutter/material.dart';
import '../models.dart/productsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MyProvider with ChangeNotifier{
final listProducts =[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
          isFav: false,
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
     isFav: false,
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
          isFav:true,
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
     isFav: false,
    ),
  ];
  Future<void> addProduct(Product newProduct)async{
   return  http.post('https://shopping-e430d.firebaseio.com/products.json',
    body: json.encode({
      'id':newProduct.id,
      'title':newProduct.title,
      'description':newProduct.description,
      'price':newProduct.price,
      'isFav':newProduct.isFav
    }),
    ).then((onValue){
      print('Success');
      listProducts.add(newProduct);
    print(newProduct.title);
    notifyListeners();
    }).catchError((onError){
      print('Error occured');
      throw onError;
    });
    
  }
   bool myFavs = false;
  List<Product> get item{
    if(myFavs){
      return listProducts.where((test)=>test.isFav).toList();
    }
    return [...listProducts];
    
  }
 
  void showAll(){
    myFavs = false;
    notifyListeners();
  }
  void showFavorites(){
    myFavs=true;
    notifyListeners();
  }
}