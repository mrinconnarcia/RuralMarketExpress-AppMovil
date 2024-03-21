import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movil_project/models/product_model.dart';

class ProductService {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://jellyfish-app-8fybc.ondigitalocean.app/api/v1/product/'));

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

  Future<ProductModel> fetchProduct(String uuid) async {
    final response = await http.get(Uri.parse('https://jellyfish-app-8fybc.ondigitalocean.app/api/v1/product/$uuid'));

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
}
