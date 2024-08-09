class Product {
  final int productID;
  final String productName;
  final double price;
  final int stock;
  final String imageURL;
  final int categoryID;
  final String brand;
  final String description;
  final String categoryName;

  Product({
    required this.productID,
    required this.productName,
    required this.price,
    required this.stock,
    required this.imageURL,
    required this.categoryID,
    required this.brand,
    required this.description,
    required this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productID: json['productID'],
      productName: json['productName'],
      price: json['price'],
      stock: json['stock'],
      imageURL: json['imageURL'],
      categoryID: json['categoryID'],
      brand: json['brand'],
      description: json['description'],
      categoryName: json['categoryName'],
    );
  }
}
