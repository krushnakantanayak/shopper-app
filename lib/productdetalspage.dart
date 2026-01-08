import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartprovider.dart';
import 'package:shop/productjson.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedsizes = 0;
  void onTap() {
    if (selectedsizes != 0) {
      final productModel = ProductModel.fromJson(widget.product);
      final cartModel = CartModel(
        id: productModel.id,
        title: productModel.title,
        price: productModel.price,
        company: productModel.company,
        size: selectedsizes,
        imageUrl: productModel.imageUrl,
      );

      final cartprovider = Provider.of<CartProvider>(context, listen: false);
      cartprovider.addProduct(cartModel);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("add sucessfully"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select size")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ProductModel.fromJson(widget.product);

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Details')),
      ),
      body: Column(
        children: [
          // Title
          Text(data.title),
          const Spacer(),
          // image
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Image.asset(
              data.imageUrl,
              height: 200,
              width: 200,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.image_not_supported,
                  size: 100,
                  color: Colors.grey,
                );
              },
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7F9),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // price
                Text('\$${data.price}'),
                const SizedBox(height: 10),
                // size list
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.sizes.length,
                      itemBuilder: (context, index) {
                        final text = data.sizes[index].toString();
                        final sized = data.sizes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedsizes = sized;
                              });
                            },
                            // size chip
                            child: Chip(
                              label: Text(text),
                              backgroundColor: selectedsizes == sized
                                  ? Colors.greenAccent
                                  : null,
                            ),
                          ),
                        );
                      }),
                ),
                // Cta Button
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: onTap,
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
