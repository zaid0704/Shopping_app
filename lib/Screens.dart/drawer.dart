import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Text('Drawer',style: TextStyle(color: Colors.white,
            fontSize: 30),),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.withOpacity(0.7),Colors.lightBlue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              )
            ),
          ),
         ListTile(
           title: Text('Manage Products'),
           trailing: Icon(Icons.add),
         ),
         Divider(),
          ListTile(
           title: Text('My Order '),
           trailing: Icon(Icons.shopping_cart),
         ),
        ],
      ),
   );
  }
}