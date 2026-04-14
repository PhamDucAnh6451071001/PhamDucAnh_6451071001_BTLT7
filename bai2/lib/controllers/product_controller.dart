import '../data/repository/product_repository.dart';
import '../data/services/product_service.dart';
import '../models/product_model.dart';

class ProductController {
  late final ProductRepository _repository;

  ProductController() {
    _repository = ProductRepository(ProductService());
  }

  Future<ProductModel> fetchProductDetail() async {
    return await _repository.getProductDetail();
  }
}