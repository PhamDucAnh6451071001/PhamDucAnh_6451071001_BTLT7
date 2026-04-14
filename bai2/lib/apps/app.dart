import 'package:flutter/material.dart';
import '../screens/products/product_detail_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Detail App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProductDetailScreen(),
    );
  }
}