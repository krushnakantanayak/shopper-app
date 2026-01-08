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
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔝 TOP SECTION (Title + Search)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  // Title
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Shoes \nCollection",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),

                  SizedBox(width: 12),

                  // Search box
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: border,
                        enabledBorder: border,
                        focusedBorder: border,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🧩 FILTER CHIPS
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilters = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectedFilters == filter
                            ? Colors.greenAccent
                            : const Color.fromRGBO(245, 247, 249, 1),
                        label: Text(filter),
                        labelStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        side: const BorderSide(color: Colors.black45),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// 👟 PRODUCT LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  final productModel = ProductModel.fromJson(product);

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: products[index]),
                        ),
                      );
                    },
                    child: ProductCard(
                      title: productModel.title,
                      price: productModel.price,
                      image: productModel.imageUrl,
                      backgroundColor: index.isEven
                          ? const Color(0xFFD8F0FD)
                          : const Color(0xFFF5F7F9),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
