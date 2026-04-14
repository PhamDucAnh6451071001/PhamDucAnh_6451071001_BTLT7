import '../../models/product_model.dart';
import '../services/product_service.dart';

class ProductRepository {
  final ProductService _productService;

  ProductRepository(this._productService);

  Future<ProductModel> getProductDetail() async {
    return await _productService.fetchProductDetail();
  }
}