import 'package:flutter/material.dart';
import '../data.dart/products.dart';
import 'package:provider/provider.dart';
import '../models.dart/productsModel.dart';
class AddProducts extends StatefulWidget {
  AddProducts({Key key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  String title;
  double price;
  String description;
  String url;
  var progress = false;
     GlobalKey<FormState> fkey =new GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final data  = Provider.of<MyProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Add Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: ()async{
              
              final k = fkey.currentState;
              if(k.validate()){
                k.save();
                setState(() {
                 progress=true; 
                });
               await  data.addProduct(Product(
                  id:DateTime.now().toString(),
                  title: title,
                  price: price,
                  description: description,
                  imageUrl: url,
                  isFav: false
                )).then((onValue){
                  setState(() {
                   progress=false; 
                  });
                  Navigator.of(context).pop();
                }).catchError((onError){
                  setState(() {
                   progress=false; 
                  });
                  showDialog(
                    context: context,
                    builder: (c){
                      return AlertDialog(
                        title: Text('Oops Error !'),
                        content: Text('Some error occured'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                });
              }
              else{
                print('Validate Failed');
              }
            },
          )
        ],),
        body:SingleChildScrollView(
          child: progress?Center(child:CircularProgressIndicator()):Form(
          key: fkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListTile(
                  title: Text('Add Your Product'),
                  trailing: Icon(Icons.shop),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                maxLines: 1,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Title',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
            ),
            onSaved: (val){
              title=val;
            },
            validator: (val){
              if(val.length==0)
               {
                 return 'Enter Valid Email';
               }
            },
            ),
             ),


             Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Price',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
            ),
            onSaved: (val){
              price=double.parse(val);
            },
            validator: (val){
              if(val.length==0||double.parse(val)==0.0)
               {
                 return 'Enter Valid Price';
               }
            },
            ),
             ), 

             Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Description',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
            ),
            onSaved: (val){
              description=val;
            },
            validator: (val){
              if(val.length==0)
               {
                 return 'Enter Valid Description';
               }
            },
            ),
             ), 
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Container(
                   width: 100,
                   height: 200,
                   child: Text('Fuck off'),
                   alignment: Alignment.center,
                 ),
                  Expanded(child: TextFormField(
               
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: 'Image Url',
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
            ),
            onSaved: (val){
              url=val;
            },
            validator: (val){
              if(val.length==0)
               {
                 return 'Enter Valid Url';
               }
            },
            ),)
                  ],
             ),   
            ],
          ),
        ),
        ),
         
      ),

    );
    }
}