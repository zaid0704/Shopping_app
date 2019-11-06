import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart/carts.dart';
class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  
  Widget build(BuildContext context) {
    final myCarts = Provider.of<Carts>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done,color: Colors.white,),
              onPressed: (){
                
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            
            Row(
              
              children: <Widget>[
                SizedBox(width: 15,),
                Text(
              'Grand Total',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30,
                fontWeight: FontWeight.normal
              ),
            ),
            Spacer(),
            Text(
              '${myCarts.grandTotal}',
              style: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 30,
                fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(width: 15,),
              ],
            ),
            
            Expanded(
              child: ListView.builder(
          itemCount: myCarts.lenght,
          itemBuilder: (ctx,i){
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
              
              elevation: 6.0,
              child: ListTile(
                leading: CircleAvatar(
                  radius:30,
                  backgroundColor: Colors.purple,
                  child:FittedBox(
                    child: Text('${myCarts.item[i].price}',style: TextStyle(color: Colors.white),
                  ) ),),
                title: Text('${myCarts.item[i].title}'),
                trailing: Text('x ${myCarts.item[i].quantity}'),
                subtitle: Text('Total : ${myCarts.item[i].quantity*myCarts.item[i].price}'),
              ),        
            );
          },
        ),

            ),
            
        
          ],
        ),
        
      ),
    );
  }
}