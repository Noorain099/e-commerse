import 'dart:async';
import 'dart:convert';

import 'package:flutter_application_1/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final String _baseUrl = "https://fakestoreapi.com";

  Future <List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse("$_baseUrl/products"));

    if(response.statusCode == 200){
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((product) => Product.fromJson(product)).toList();
    }
    else{
      throw Exception("Failed to load data....");
    }
  }
}