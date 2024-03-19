class ProductModel {
  final String id;
  final String name;
  final double price;
  final String description;
  final String urlImg;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.urlImg,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['uuid'],
      name: json['name'],
      price: json['price'] != null ? double.parse(json['price']) : 0.0, // Validar y parsear el precio
      description: json['description'],
      urlImg: json['url_img'],
    );
  }
}
