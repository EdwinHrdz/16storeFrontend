import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/brand.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../model/user.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselCurrentIndex = 0.obs;
  final user = User(
    userId: 0,
    name: '',
    lastName: '',
    userName: '',
    email: '',
    phoneNo: '',
    userType: 0,
    token: '',
    isSuccess: 0,
    message: '',
  ).obs;

  final categories = <Category>[].obs;
  final products = <Product>[].obs;
  final brands = <Brand>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    fetchProducts();
  }

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }

  void setUser(User userData) {
    user.value = userData;
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

  void fetchProducts() async {
    final response = await http.get(Uri.parse('http://localhost:45103/api/Store/products'));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as List;
      products.value = jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
