import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/view_models/product_view_model.dart';
import 'res/app_routes.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel(), lazy: false),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false ,
        title: 'Ven3',
        theme: ThemeData(
              fontFamily: 'Gilroy-Regular',
              primarySwatch: Colors.green,
            ),
          routes: AppRoutes.routes,
        initialRoute: AppRoutes.productsScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}

