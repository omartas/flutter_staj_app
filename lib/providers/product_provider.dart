import 'package:flutter/material.dart'; 
import '../models/product_model.dart';
import '../services/api_service.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    try {
      _products = await ApiService().fetchProducts();
      print(_products);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}