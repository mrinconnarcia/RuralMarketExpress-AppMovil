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

class UserProfileModel {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String largePictureUrl;

  UserProfileModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.largePictureUrl,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final picture = json['picture'];

    return UserProfileModel(
      firstName: name['first'],
      lastName: name['last'],
      email: json['email'],
      phone: json['phone'],
      largePictureUrl: picture['large'],
    );
  }
}
