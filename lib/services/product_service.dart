import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:movil_project/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://shark-app-o8v24.ondigitalocean.app/api/v1/product/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['status'] == 'succes') {
        if (responseData['data'] != null && responseData['data']['list'] != null) {
          final List<dynamic> productList = responseData['data']['list'];
          List<ProductModel> products = productList.map((product) {
            return ProductModel(
              id: product['uuid'],
              name: product['name'],
              price: double.parse(product['price']),
              description: product['description'],
              urlImg: product['url_img'],
            );
          }).toList();

          return products;
        } else {
          throw Exception('No product list available');
        }
      } else {
        throw Exception('API returned an error: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to load products: ${response.reasonPhrase}');
    }
  }

  Future<UserProfileModel> fetchUserProfile() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      final List<dynamic> results = responseData['results'];
      final userProfileJson = results.first;

      return UserProfileModel.fromJson(userProfileJson);
    } else {
      throw Exception('Failed to load user profile: ${response.reasonPhrase}');
    }
  }


  Future<ProductModel> fetchProduct(String uuid) async {
    final response = await http.get(Uri.parse('https://shark-app-o8v24.ondigitalocean.app/api/v1/product/$uuid'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['status'] == 'success') {
        final Map<String, dynamic> productData = responseData['data']['message'];
        return ProductModel(
          id: productData['uuid'],
          name: productData['name'],
          price: double.parse(productData['price']),
          description: productData['description'],
          urlImg: productData['url_img'],
        );
      } else {
        throw Exception('API returned an error: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to load product: ${response.reasonPhrase}');
    }
  }

  Future<List<Map<String, dynamic>>> fetchOffers() async {
    final url = Uri.parse('https://8vfbfqxf-3006.use2.devtunnels.ms/api/v1/offer/all-offers');
    print(url);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Accede a la lista de ofertas dentro de "data"
      final List<dynamic> offerList = responseData['data']['list'];

      // Convierte la lista de ofertas a una lista de Map<String, dynamic>
      return offerList.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to fetch offers: ${response.reasonPhrase}');
    }
  }

  Future<void> addUser(String name, String lastname, String phone, String email, String birthday, String password) async {
    final url = Uri.parse('https://seashell-app-i484t.ondigitalocean.app/api/v1/user/create-user');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': Random().nextInt(100000), // Genera un ID único para el usuario
        'name': name,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'birthday': birthday,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      print('User created successfully');
    } else {
      throw Exception('Failed to create user: ${response.reasonPhrase}');
    }
  }

  Future<void> addProduct(String name, num price, String description, String urlImg) async {
    final url = Uri.parse('https://shark-app-o8v24.ondigitalocean.app/api/v1/product/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'price': price,
        'description': description,
        'url_img': urlImg,
      }),
    );

    if (response.statusCode == 201) {
      print('Product added successfully');
    } else {
      throw Exception('Failed to add product: ${response.reasonPhrase}');
    }
  }

  Future<void> addOffer(String name, num price, String description, String discount, String availability) async {
    final url = Uri.parse('https://8vfbfqxf-3006.use2.devtunnels.ms/api/v1/offer/create-offer/');

    // Genera un ID único para la oferta
    final offerId = Random().nextInt(100000);

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'id': offerId,
        'title': name,
        'description': description,
        'price': price,
        // 'url_img': urlImg,
        'discount': discount,
        'availability': availability,
      }),
    );

    if (response.statusCode == 201) {
      print('Offer added successfully');
    } else {
      throw Exception('Failed to add offer: ${response.reasonPhrase}');
    }
  }

  Future<void> updateProduct(String uuid, String name, num price, String description, String urlImg) async {
    final url = Uri.parse('https://shark-app-o8v24.ondigitalocean.app/api/v1/product/$uuid');
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'price': price,
        'description': description,
        'url_img': urlImg,
      }),
    );

    if (response.statusCode == 200) {
      print('Product updated successfully');
    } else {
      throw Exception('Failed to update product: ${response.reasonPhrase}');
    }
  }

  Future<void> deleteOffer(String offerId) async {
    final url = Uri.parse('https://8vfbfqxf-3006.use2.devtunnels.ms/api/v1/offer/delete/$offerId');

    final response = await http.delete(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print('Offer deleted successfully');
    } else {
      throw Exception('Failed to delete offer: ${response.reasonPhrase}');
    }
  }

}
