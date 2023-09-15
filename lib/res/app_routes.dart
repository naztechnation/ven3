
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mobile_ui/products_screen.dart';



class AppRoutes {
  ///Route names used through out the app will be specified as static constants here in this format
  static const String productsScreen = 'productsScreen';
  static const String productDetails = 'productDetails';
  


  static Map<String, Widget Function(BuildContext)> routes = {
    productsScreen: (context) =>  const Product(),
    productDetails: (context) =>  Container(),
    
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case productsScreen:
        return MaterialPageRoute(
          builder: (context) => const  Product(),
        );
      case productDetails:
        return MaterialPageRoute(builder: (context) =>  Container());
     
   
//Default Route is error route

      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name!));
    }
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
