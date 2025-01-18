import 'dart:convert';

import 'package:clean_architecture/core/api_baseclass/ApiBaseServices.dart';
import 'package:clean_architecture/domain/entities/model/product_model.dart';

class FetchDataFromApi {
  Future<List<ProductModel>> fetchProducts() async {
    List<ProductModel> products = <ProductModel>[];

    try {
      final response = await ApiBaseServices.getRequest(endPoint: "/products");

      if (response.statusCode == 200) {
        products = productModelFromJson(jsonEncode(response.data));
      } else {
        products = [];
      }
    } catch (e) {
      products = [];

      print("Error fetching products: $e");
    }
    return products;
  }
}
