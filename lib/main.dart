import 'package:flutter/material.dart';
import 'package:shoping_app/Screens.dart/overView.dart';
import 'package:provider/provider.dart';
import './Screens.dart/firstScreen.dart';
import './data.dart/products.dart';
import './Screens.dart/detailProduct.dart';
import './Screens.dart/cart.dart';
import './data.dart/carts.dart';
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
      },
      home: frontScreen()
    ),
    
    ); 
    
      
  }
}