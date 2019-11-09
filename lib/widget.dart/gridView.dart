import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:provider/provider.dart';
import 'package:shoping_app/models.dart/cartItem.dart';
import '../models.dart/productsModel.dart';
import '../data.dart/carts.dart';
class gridView extends StatefulWidget {
  gridView({Key key}) : super(key: key);

  @override
  _gridViewState createState() => _gridViewState();
}

class _gridViewState extends State<gridView> {
  
  Widget build(BuildContext context) {
    final cartsdata = Provider.of<Carts>(context);
    final data = Provider.of<Product>(context);
    return InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('/detailProduct',arguments: data.id);
          },
          child:GridTile(
          child: ClipRRect(child: Image.network('${data.imageUrl}',fit: BoxFit.cover,),
          borderRadius: BorderRadius.circular(15),),
          footer: GridTileBar(
            title: Text('${data.title}',style: TextStyle(fontSize: 10),),
            backgroundColor: Colors.black87,
            leading: InkWell(
              child: Icon(
              Icons.shopping_cart,
              color: Colors.red,
              size: 30,
              ),
              onTap: (){
                  Scaffold.of(context).hideCurrentSnackBar();
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Added to Cart'),
                      duration: Duration(
                        seconds: 2
                      ),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: (){
                          cartsdata.undo(data.title);
                          print('Pressed');
                        },
                      ),
                    )
                  );
                cartsdata.addItem(CartModel(
                  data.id,
                  data.title,
                  data.price,
                  data.imageUrl,
                  data.description));
              },
            ),
            trailing: InkWell(child:data.isFav?Icon(Icons.favorite,
            color: Colors.red,
            size: 30,
            ):
            Icon(Icons.favorite_border,color: Colors.redAccent,
            size: 30,),
            onTap: (){
              data.toggleFav();
               
            },
            ),
    ),),);
  }
}