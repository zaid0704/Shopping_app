import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data.dart/myOrder.dart';
class Order extends StatelessWidget {
  const Order({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =Provider.of<MyOrder>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Order'),),
        body: ListView.builder(
          itemCount: data.item.length,
          itemBuilder: (ctx,i){
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                 border: Border.all(color: Colors.blueAccent)
              ),
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              height: 200,
              child: ListTile(
                leading:CircleAvatar(
                  backgroundImage: NetworkImage(data.item[i].url),
                ) ,
                title: Text('${data.item[i].title}',style: TextStyle(fontSize: 25),),
                subtitle: Text('${data.item[i].description}'),
                trailing: Text('${data.item[i].price}',style: TextStyle(fontSize: 25),),
              ),
            );
          },
        ),
      ),
    );
  }
}