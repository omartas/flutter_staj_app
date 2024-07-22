import 'dart:convert';
import 'package:flutter_staj_app/models/product_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse('$_baseUrl/products'); 
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      var dataList = data.map((item) => Product.fromJson(item)).toList();
      return dataList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}