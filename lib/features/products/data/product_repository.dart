import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:newnop_flutter_assessment/core/constants/app_constants.dart';
import 'package:newnop_flutter_assessment/shared/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetchProducts() async{
    await Future.delayed(AppConstants.mockNetworkDelay);

    final raw = await rootBundle.loadString(AppConstants.productsAssetPath);
    final List<dynamic> decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => Product.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}