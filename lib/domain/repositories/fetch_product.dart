import 'package:clean_architecture/domain/entities/model/product_model.dart';

abstract class FetchProductRepositories {
  Future<List<ProductModel>> fetchProduct();
//}
}
