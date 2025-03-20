import 'package:flutter/material.dart';
import 'package:shop/productcard.dart';
import 'package:shop/productdetalspage.dart';
import 'package:shop/productjson.dart';

class MyfirstPage extends StatefulWidget {
  const MyfirstPage({super.key});

  @override
  State<MyfirstPage> createState() => _MyfirstPageState();
}

class _MyfirstPageState extends State<MyfirstPage> {
  final List<String> filters = ['All', 'addidas', 'Nike', 'Bata'];
  late String selectedFilters;

  @override
  void initState() {
    super.initState();
    selectedFilters = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black45),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              // Tittle
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoes \n Collection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              // Search box
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              )
            ],
          ),
          // Shoes Brand list chip
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilters = filter;
                      });
                    },
                    //chip
                    child: Chip(
                      backgroundColor: selectedFilters == filter
                          ? Colors.greenAccent
                          : const Color.fromRGBO(245, 247, 249, 1),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      side: const BorderSide(color: Colors.black45),
                    ),
                  ),
                );
              },
            ),
          ),
          // Shoes Card

          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // Navigate ProductDetailsPage
                    return ProductDetailsPage(product: products[0]);
                  }),
                );
              },
              // Shoes Image List
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final productModel = ProductModel.fromJson(product);

                    return ProductCard(
                      title: productModel.title,
                      price: productModel.price,
                      image: productModel.imageUrl,
                      backgroundColor: index.isEven
                          ? const Color(0xFFD8F0FD)
                          : const Color(0xFFF5F7F9),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
