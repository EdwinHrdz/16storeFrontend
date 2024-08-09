class Brand {
  final int brandID;
  final String brandName;
  final String imageFileName;

  Brand({
    required this.brandID,
    required this.brandName,
    required this.imageFileName,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      brandID: json['brandID'],
      brandName: json['brandName'],
      imageFileName: json['imageFileName'],
    );
  }
}
