import 'package:newnop_flutter_assessment/shared/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}