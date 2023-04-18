import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/get_data/provider/Product_Provider.dart';
import 'Screens/get_data/view/Product_view.dart';
import 'Screens/post_data/provider/Post_Provider.dart';
import 'Screens/post_data/view/Post_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddScreenProvider(),),
        ChangeNotifierProvider(create: (context) => AddProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => ProductAddScreen(),
          'add':(context) => PostScreen(),
        },
      ),
    ),
  );
}