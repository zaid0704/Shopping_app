import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models.dart/productsModel.dart';
class gridView extends StatefulWidget {
  gridView({Key key}) : super(key: key);

  @override
  _gridViewState createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  
  Widget build(BuildContext context) {
    final data = Provider.of<Product>(context);
    return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/detailProduct',arguments: data.id);
          },
          child: GridTile(
          
          child: ClipRRect(child: Image.network('${data.imageUrl}',fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(15),),
          footer: GridTileBar(
            title: Text('${data.title}',style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.black54,
            leading: Icon(Icons.shop),
            trailing: InkWell(child:data.isFav?Icon(Icons.favorite,color: Colors.orange,):
            Icon(Icons.favorite_border,color: Colors.redAccent,),
            onTap: (){
              data.toggleFav();
               
            },
            ),
    ),),);
  }
}