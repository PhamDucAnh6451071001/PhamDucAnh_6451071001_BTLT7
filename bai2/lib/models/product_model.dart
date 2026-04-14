class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0,
      description: json['description'] ?? '',
    );
  }
}