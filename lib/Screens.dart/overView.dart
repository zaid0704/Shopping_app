import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../data.dart/products.dart';
import 'package:provider/provider.dart';
import '../models.dart/productsModel.dart';
import '../widget.dart/gridView.dart';
class OverView extends StatefulWidget {
  
 
  
  @override
  _OverViewState createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  
  
  Widget build(BuildContext context) {
    
    final myData = Provider.of<MyProvider>(context);
  
    final myListProd =myData.item;
   
    int c =0;
    
    return  GridView(
      padding: const EdgeInsets.all(20),
      children: myListProd.map((f){
       return ChangeNotifierProvider(
         builder: (_)=> f,
         child: gridView()
          );
           }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3/5,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        maxCrossAxisExtent: 200,
      ),
      
    
    );
    
  }
}