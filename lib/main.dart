import 'package:flutter/material.dart';
import 'package:shoping_app/Screens.dart/overView.dart';
import 'package:provider/provider.dart';

import './data.dart/products.dart';
import './Screens.dart/detailProduct.dart';
void main() => runApp(MyApp());
enum Favs{
  Favorites,
  All
}
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  bool favs = true;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context)=>MyProvider(),
      child: MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand'
      ),
      routes: {
        '/detailProduct':(context)=>detailProduct(),
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shopping',style: TextStyle(fontFamily: 'Quicksand',fontSize: 20),),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text('Favorites'),value: Favs.Favorites,),
              PopupMenuItem(child:Text('All Items'),value: Favs.All,)
            ],
            onSelected: (val){
              if(val==Favs.Favorites){
                 print('Favorites');
                 OverView(favs);
              }
              
               else {
                 print('All Items ');
                 OverView(!favs);
               }
               
            },
          ),
        ],
        ),
        body: OverView(!favs),
      ),
    ),);
    
  }
}