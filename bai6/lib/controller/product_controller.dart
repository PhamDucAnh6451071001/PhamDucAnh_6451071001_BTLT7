import '../models/product_model.dart';

class ProductController {
  final List<ProductModel> allProducts = [
    ProductModel(name: 'iPhone 15'),
    ProductModel(name: 'Samsung Galaxy S24'),
    ProductModel(name: 'Oppo Reno'),
    ProductModel(name: 'Xiaomi Redmi Note'),
    ProductModel(name: 'Laptop Asus'),
    ProductModel(name: 'Tai nghe Bluetooth'),
  ];

  Future<List<ProductModel>> searchProducts(String keyword) async {
    await Future.delayed(const Duration(seconds: 1));

    return allProducts
        .where((product) =>
        product.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }
}