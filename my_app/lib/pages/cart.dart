import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/provider/shoppingcart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart'),),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: prov.cart.isEmpty 
                  ? const Text('No Products Yet')
                  : ListView.builder(
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        trailing: TextButton(
                          child: const Text('Remove'),
                          onPressed: () {
                            context.read<ShoppingCart>().removeItem(prov.cart[index]);
                          }
                        ),
                      );
                    }
                  )
                ),
                createTotal(prov),
                createResetButton(prov),
                createCheckoutButton(prov, context)
              ],
            );
          },
        )
      ),
    );

  }

  Widget createTotal(prov) {
    return Text('Total: ${prov.getTotal()}');
  }

  Widget createResetButton(prov) {
    return TextButton(
      child: const Text('Reset'),
      onPressed: () {
        prov.removeAll();
      },
    );
  }

  Widget createCheckoutButton(prov, context) {
    return TextButton(
      child: const Text('Checkout'),
      onPressed: () {
        Navigator.pushNamed(context, '/checkout');
      },
    );
  }
}