import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class StoreItem {
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  StoreItem(
      {required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory StoreItem.fromJson(Map<String, dynamic> json) {
    return StoreItem(
        title: json['title'],
        price: json['price'].toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
  }

  @override
  String toString() {
    return 'StoreItem{title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: json['rate'].toDouble(), count: json['count']);
  }
}

class ApiNetwork {
  Future<List<StoreItem>> getItems() async {
    // final httpSimulation = HttpSimulation();
    String _url = 'https://fakestoreapi.com/products';
    try {
      final response = await http.get(Uri.parse(_url));
      // final response = httpSimulation.getResponse(400);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<StoreItem> items = [];
        for (var i = 0; json.length > i; i++) {
          final entry = json[i];
          items.add(StoreItem.fromJson(entry));
        }
        return items;
      } else if (response.statusCode == 400) {
        // print('API LAYER: ${response.statusCode}');
        throw CustomException(error: 'Client Side Error');
      } else if (response.statusCode == 500) {
        throw CustomException(error: 'Server side error');
      } else {
        throw CustomException(error: 'Unknown error');
      }
    } on SocketException catch (e) {
      // print('API LAYER $e');
      throw CustomException(error: 'No internet');
    } on TimeoutException catch (e) {
      // print('Timeout API LAYER $e');
      throw CustomException(error: 'Timeout error');
    }
  }
}

class HttpSimulation {
  http.Response getResponse(int errorCode) {
    return http.Response('', errorCode);
  }
}

class CustomException implements Exception {
  final String error;

  CustomException({required this.error});

  @override
  String toString() {
    return error;
  }
}
