import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../get_data/provider/Product_Provider.dart';
import '../provider/Post_Provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}
class _PostScreenState extends State<PostScreen> {
  AddProvider? T,F;
  AddScreenProvider? getT,getF;
  @override
  Widget build(BuildContext context) {
    T = Provider.of<AddProvider>(context,listen: true);
    F = Provider.of<AddProvider>(context,listen: false);
    getT = Provider.of<AddScreenProvider>(context,listen: true);
    getF = Provider.of<AddScreenProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          shadowColor: Colors.white24,
          title: Text("Add Product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(9),
                child: TextFormField(
                    controller: T!.txtName,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: "Enter Name",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(9),
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: T!.txtRate,
                    decoration: InputDecoration(
                      labelText: "Enter Rate",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: T!.txtPrice,
                    decoration: InputDecoration(
                      labelText: "Enter Price",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: T!.txtOffer,
                    decoration: InputDecoration(
                      labelText: "Enter Offer",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: T!.txtDescription,
                    decoration: InputDecoration(
                      labelText: "Enter Description",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: T!.txtCategory,
                    decoration: InputDecoration(
                      labelText: "Enter Category",
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        )
                    )
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: () async{
                String name = T!.txtName.text;
                String offer = T!.txtOffer.text;
                String description = T!.txtDescription.text;
                String category = T!.txtCategory.text;
                String rate = T!.txtRate.text;
                String price = T!.txtPrice.text;
                String msg = await F!.postApi(name,rate,price,offer,description,category);
                getF!.getApi();
                print("$msg");
                Navigator.pop(context);
              }, child: Text("Add",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: Colors.black,side: BorderSide(color: Colors.white)),),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
