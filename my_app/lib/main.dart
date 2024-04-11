import 'package:flutter/material.dart';
import 'package:my_app/pages/checkout.dart';
import 'package:provider/provider.dart';
import 'package:my_app/pages/cart.dart';
import 'package:my_app/pages/catalog.dart';
import 'package:my_app/provider/shoppingcart.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart())
      ], 
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const Catalog());
        }
        else if (settings.name == '/cart') {
          return MaterialPageRoute(builder: (context) => const Cart());
        } 
        else if (settings.name == '/checkout') {
          return MaterialPageRoute(builder: (context) => const Checkout());
        }
        return null;
      },
    );
  }
}