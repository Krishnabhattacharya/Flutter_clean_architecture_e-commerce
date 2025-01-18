import 'package:clean_architecture/domain/entities/model/product_model.dart';
import 'package:clean_architecture/domain/repositories/fetch_product.dart';

class ExicuteApicall {
  final FetchProductRepositories fetchProductRepositories;
  ExicuteApicall(this.fetchProductRepositories);
  Future<List<ProductModel>> exicuteApicallDone() async {
    return await fetchProductRepositories.fetchProduct();
  }
}
