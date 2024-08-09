import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:store16/features/shop/model/category.dart';
import 'package:store16/features/shop/model/brand.dart';
import 'package:store16/features/shop/model/product.dart';  // Importa el modelo Product

class StoreController extends GetxController {
  var categories = <Category>[].obs;
  var brands = <Brand>[].obs;
  var products = <Product>[].obs;  // Nueva lista de productos
  var productsByCategory = <int, List<Product>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchBrands();
    fetchProducts();  // Llamada para cargar los productos
  }

  void fetchCategories() async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/categories'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      categories.value = jsonResponse.map((data) => Category.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  void fetchBrands() async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/brands'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      brands.value = jsonResponse.map((data) => Brand.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load brands');
    }
  }

  void fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/products'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      products.value = jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
  void fetchProductsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/productsByCategory/$categoryId'));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      productsByCategory[categoryId] = jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products for category $categoryId');
    }
  }
}


