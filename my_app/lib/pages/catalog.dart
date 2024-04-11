import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/model/item.dart';
import 'package:my_app/provider/shoppingcart.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {

  List<Item> products = [
    Item("Shampoo - 10.0", 10.0, 123),
    Item("Soap - 12.0", 12.0, 862),
    Item("Toothpaste - 40.0", 40.0, 532)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Catalog')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.shop),
                    title: Text(products[index].name),
                    trailing: TextButton(
                      child: const Text('Add'),
                      onPressed: () {
                        context.read<ShoppingCart>().addItem(products[index]);
                      },
                    ),
                  );
                }
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        }
      ),
    );
  }
}