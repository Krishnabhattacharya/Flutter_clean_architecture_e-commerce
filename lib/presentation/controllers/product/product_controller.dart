import 'package:clean_architecture/data/use_case/exicute_product_apicall.dart';
import 'package:clean_architecture/domain/entities/model/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  ExicuteApicall _exicuteApicalll;

  ProductController(this._exicuteApicalll);
  List<ProductModel> products = <ProductModel>[];
  var filteredProducts = <ProductModel>[].obs;

  var isLoading = true.obs;
  var selectedCategory = "All".obs;
  var selectedPriceRange = 1000.0.obs;

  final categories = ['All', 'Electronics', 'Fashion', 'Home Appliances'];
  final priceRanges = [0.0, 50.0, 100.0, 500.0, 1000.0];

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final response = await _exicuteApicalll.exicuteApicallDone();
      filteredProducts.value = response;
      update();
    } catch (e) {
      products = [];
      filteredProducts.value = [];
      update();

      print("Error fetching products: $e");
    } finally {
      isLoading(false);
      update();
    }
  }

  void applyFilters() {
    var tempProducts = products;
    if (selectedCategory.value != 'All') {
      tempProducts = tempProducts.where((product) {
        final mappedCategory = mapCategoryToEnum(product.category!.name);
        return mappedCategory == selectedCategory.value;
      }).toList();
    }
    tempProducts = tempProducts.where((product) {
      return product.price != null &&
          product.price! <= selectedPriceRange.value;
    }).toList();
    filteredProducts.value = tempProducts;
    update();
  }

  String mapCategoryToEnum(String category) {
    switch (category.toLowerCase()) {
      case 'electronics':
        return 'Electronics';
      case 'jewelery':
        return 'Fashion';
      case "men's clothing":
        return 'Fashion';
      case "women's clothing":
        return 'Fashion';
      default:
        return 'All';
    }
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    applyFilters();
  }

  void filterByPriceRange(double maxPrice) {
    selectedPriceRange.value = maxPrice;
    applyFilters();
  }

  void filterProducts(String query) {
    filterByCategory("All");
    if (query.isEmpty) {
      applyFilters();
    } else {
      var tempProducts = filteredProducts;

      filteredProducts.value = tempProducts.where((product) {
        return product.title?.toLowerCase().contains(query.toLowerCase()) ??
            false;
      }).toList();
    }
    update();
  }
}
