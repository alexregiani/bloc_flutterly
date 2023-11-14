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
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final List<StoreItem> items = [];
        for (var i = 0; i < json.length; i++) {
          final entry = json[i];
          items.add(StoreItem.fromJson(entry));
        }
        return items;
      } else if (response.statusCode == 400) {
        throw Exception('Client side error (400)');
      } else if (response.statusCode == 500) {
        throw Exception('Server side error (500)');
      } else {
        throw Exception('unknown error ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('socket API LAYER ${e.toString()}');
      throw Exception('');
    } on TimeoutException catch (e) {
      print('Timeout API LAYER ${e.toString()}');
      throw Exception('Network Error $e');
    }
  }
}
