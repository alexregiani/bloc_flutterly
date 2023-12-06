import 'dart:convert';

import 'package:http/http.dart' as http;

class Product {
  String title;
  double price;
  String description;
  List images;

  Product({required this.title, required this.price, required this.description, required this.images});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        images: json['images']);
  }

  @override
  String toString() {
    return 'Product{title: $title, price: $price, description: $description, images: $images}';
  }
}

class NetworkRequest {
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<Product> result = [];
      for (var i = 0; json.length > i; i++) {
        var entry = Product.fromJson(json['products'][i]);
        result.add(entry);
      }
      return result;
    } else {
      throw Exception('error');
    }
  }
}
