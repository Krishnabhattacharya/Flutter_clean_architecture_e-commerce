import 'package:get/get.dart';
import 'package:clean_architecture/data/data_sources/fetdata.dart';
import 'package:clean_architecture/data/repositories/fetch_product_repo_imp.dart';
import 'package:clean_architecture/data/use_case/exicute_product_apicall.dart';
import 'package:clean_architecture/domain/repositories/fetch_product.dart';
import 'package:clean_architecture/presentation/controllers/product/product_controller.dart';

class DataBindings extends Bindings {
  @override
  void dependencies() {
    // Step 1: Register FetchDataFromApi first because it has no dependencies
    Get.lazyPut(() => FetchDataFromApi());

    // Step 2: Register FetchProductRepoImp second because it depends on FetchDataFromApi
    Get.lazyPut<FetchProductRepositories>(() => FetchProductRepoImp(
        Get.find())); // Get.find() will resolve FetchDataFromApi

    // Step 3: Register ExicuteApicall, which depends on FetchProductRepoImp
    Get.lazyPut(() => ExicuteApicall(Get.find()));

    // Step 4: Register ProductController, which depends on ExicuteApicall
    Get.lazyPut(() => ProductController(Get.find()));
  }
}
