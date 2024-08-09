class Category {
  final int categoryID;
  final String categoryName;
  final String imageFileName;

  Category({required this.categoryID, required this.categoryName, required this.imageFileName});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryID: json['categoryID'],
      categoryName: json['categoryName'],
      imageFileName: json['imageFileName'],
    );
  }
}
