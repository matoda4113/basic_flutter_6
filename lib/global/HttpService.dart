import 'dart:convert';

import '../model/ProductModel.dart';
import 'package:http/http.dart' as http;

import '../vo/Product.dart';


class HttpService {

  Future<ProductModel> getProductList() async {
    String url =  "https://dummyjson.com/products";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }



  Future<Product> getProductOne(int id) async {
    String url =  "https://dummyjson.com/products/${id}";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }


}

