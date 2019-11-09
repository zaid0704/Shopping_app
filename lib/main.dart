import 'package:flutter/material.dart';
import 'package:shoping_app/Screens.dart/addProduct.dart';
import 'package:shoping_app/Screens.dart/overView.dart';
import 'package:provider/provider.dart';
import './Screens.dart/firstScreen.dart';
import './data.dart/products.dart';
import './Screens.dart/detailProduct.dart';
import './Screens.dart/cart.dart';
import './data.dart/carts.dart';
import './Screens.dart/manage.dart';
import './Screens.dart/addProduct.dart';
import './Screens.dart/order.dart';
import './data.dart/myOrder.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool favs = true;
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
      value:MyProvider(),),
      ChangeNotifierProvider(
        builder: (ctx)=> Carts(),
        
      ),
      ChangeNotifierProvider(
        builder: (ctx)=>MyOrder(),
      )
      ],
      child: MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand'
      ),
      routes: {
        '/detailProduct':(context)=>detailProduct(),
        '/cartScreen':(ctx)=>Cart(),
        '/ManageProduct':(ctx)=>ManageProduct(),
        '/AddProducts':(c)=>AddProducts(),
        '/order':(ctx)=>Order()
      },
      home: frontScreen()
    ),
    
    ); 
    
      
  }
}