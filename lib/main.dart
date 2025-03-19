import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/cartprovider.dart';

import 'package:shop/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "shopping App",
        home: MyHomePage(),
      ),
    );
  }
}
