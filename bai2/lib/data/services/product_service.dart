import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product_model.dart';
import '../../utils/api_constants.dart';

class ProductService {
  Future<ProductModel> fetchProductDetail() async {
    final response = await http.get(
      Uri.parse(ApiConstants.productDetailEndpoint),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return ProductModel.fromJson(data);
    } else {
      throw Exception('Không tải được chi tiết sản phẩm');
    }
  }
}