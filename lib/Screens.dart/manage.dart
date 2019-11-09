import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_app/data.dart/products.dart';
class ManageProduct extends StatelessWidget {
  const ManageProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyProvider>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Manage Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed('/AddProducts');
            },
          )
        ],),
        body: ListView.builder(
      itemCount: data.item.length,
      itemBuilder: (ctx,i){
        return Card(
          elevation: 4.0,
          child: ListTile(
            leading: CircleAvatar(
              radius:30 ,
             
              backgroundImage: NetworkImage(data.item[i].imageUrl),
            ),
            title: Text('${data.item[i].title}'),
          ),
        );
      },
    ),
      ),
      
    );
    
  }
}