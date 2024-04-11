import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/provider/shoppingcart.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout'),),
      body: Center(
        child: Consumer<ShoppingCart>(
          builder: (context, prov, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Item Details'),
                Expanded(
                  child: prov.cart.isEmpty 
                  ? const Text('No items to checkout!')
                  : ListView.builder(
                    itemCount: prov.cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(prov.cart[index].name),
                        trailing: const Text(""),
                      );
                    }
                  )
                ),
                (prov.cart.isEmpty) ? const Text("") : createPay(prov, context), createTotal(prov)
              ],
            );
          },
        )
      )
    );
  }

  Widget createTotal(prov) {
    return Text('Total Cost to Pay: ${prov.getTotal()}');
  }

  Widget createPay(prov, context) {
    return TextButton(
      child: const Text('Pay Now!'),
      onPressed: () {
        prov.removeAll();
        Navigator.pushNamed(context, '/');
        const snackBar = SnackBar(
          content: Text('Payment Successful!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}