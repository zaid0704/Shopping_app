import 'package:flutter/material.dart';
import './overView.dart';

enum Favs{
  Favorites,
  All
}

class frontScreen extends StatefulWidget {
  frontScreen({Key key}) : super(key: key);

  @override
  _frontScreenState createState() => _frontScreenState();
}

class _frontScreenState extends State<frontScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping',
          style: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 20),
            ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart,
            color: Colors.white,),
            onPressed: (){
              Navigator.of(context).pushNamed('/cartScreen');
            },

          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_)=>[
              PopupMenuItem(child: Text('Favorites'),value: Favs.Favorites,),
              PopupMenuItem(child:Text('All Items'),value: Favs.All,)
            ],
            onSelected: (val){
              
              // if(val==Favs.Favorites){
              //    print('Favorites');
              //   OverView();
              // }
              
              //  else {
              //    print('All Items ');
              //   OverView();
               
              //  }
               
            },
          ),
        ],
        ),
        body: OverView(),
      );
  }
}