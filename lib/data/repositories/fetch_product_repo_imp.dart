import 'package:clean_architecture/data/data_sources/fetdata.dart';
import 'package:clean_architecture/domain/entities/model/product_model.dart';
import 'package:clean_architecture/domain/repositories/fetch_product.dart';

class FetchProductRepoImp implements FetchProductRepositories {
  final FetchDataFromApi fetchProductDataSource;
  FetchProductRepoImp(this.fetchProductDataSource);
  @override
  Future<List<ProductModel>> fetchProduct() async {
    return await fetchProductDataSource.fetchProducts();
  }
}
