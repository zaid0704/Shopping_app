import 'package:flutter/material.dart';
import '../data.dart/products.dart';
import 'package:provider/provider.dart';
import '../models.dart/productsModel.dart';
class detailProduct extends StatefulWidget {
  detailProduct({Key key}) : super(key: key);

  @override
  _detailProductState createState() => _detailProductState();
}

class _detailProductState extends State<detailProduct> {
  @override
  Widget build(BuildContext context) {
    final chosenProductId = ModalRoute.of(context).settings.arguments as String;
    final myData = Provider.of<MyProvider>(context);
    final myListProd = myData.item;
    
    final item = myListProd.firstWhere((test){
      return test.id == chosenProductId;
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(item.title),
        ),
        body:SingleChildScrollView(
          child:displayDetail(item) ,
        ),
        
      ),
    );
  }
  Widget displayDetail(Product item){
    return Column(
      children: <Widget>[
        ClipRRect(
          child: Image.network('${item.imageUrl}',fit: BoxFit.contain,),
          borderRadius: BorderRadius.circular(15),
          
        ),
        Text('Price is ${item.price}',style: TextStyle(fontFamily: 'Quicksand',fontSize: 15,fontWeight: FontWeight.bold),),
        SizedBox(height: 20,),
        Text('Description',style: TextStyle(fontFamily: 'Quicksand',fontWeight: FontWeight.bold,fontSize: 15),),
        SizedBox(height: 20,),
         Text('${item.description}')
      ],
     
    );
  }
}