import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartprovider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<CartProvider>(context);
    final carts = cartprovider.cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("cart"),
      ),
      body: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            final cartModel = carts[index];
            return ListTile(
              subtitle: Text('Size: ${cartModel.size}'),
              leading: CircleAvatar(
                radius: 30,
                child: Image.asset(
                  cartModel.imageUrl,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: const Text("Delete Product"),
                            content: const Text(
                              "Are you sure you want to be delete product from the cart ?",
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('no')),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cartprovider.removeProduct(cartModel);
                                },
                                child: const Text("yes"),
                              ),
                            ]);
                      });
                },
                icon: const Icon(Icons.delete),
              ),
              title: Text(cartModel.title),
            );
          }),
    );
  }
}
