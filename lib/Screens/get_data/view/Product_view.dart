import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../post_data/provider/Post_Provider.dart';


class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({Key? key}) : super(key: key);

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AddScreenProvider>(context,listen: false).getApi();
  }
  AddScreenProvider? T, F;
  @override
  Widget build(BuildContext context) {
    T = Provider.of<AddScreenProvider>(context, listen: true);
    F = Provider.of<AddScreenProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Products",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          actions: [
            IconButton(onPressed: () async {

     {
      var Status = await[
          Permission.camera,
          Permission.location,
              Permission.storage,
              ].request();
            }
            }, icon: Icon(Icons.person)),
          ],
        ),
        body: ListView.builder(
          itemCount: T!.jsonData!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    width: 78,
                    alignment: Alignment.centerLeft,
                    child: Text("${T!.jsonData![index].productName}"),),
                  SizedBox(width: 38,),
                  Container(
                    width: 80,
                    alignment: Alignment.centerLeft,
                    child: Text("${T!.jsonData![index].productCategory}"),),
                  SizedBox(width: 42,),
                  Container(
                    width: 78,
                    child: Text("₹${T!.jsonData![index].productPrice}"),),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)
              ),
            );
          },
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, 'add');
            },child: Icon(Icons.add,color: Colors.white),),
        ),
      ),
    );
  }
}
