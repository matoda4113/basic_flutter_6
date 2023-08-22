import 'dart:convert';

import '../model/ProductModel.dart';
import 'package:http/http.dart' as http;


class HttpService {

  Future<ProductModel> getProductList() async {
    String url =  "https://dummyjson.com/products?limit=1";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception("server_fail");
    }
  }

}