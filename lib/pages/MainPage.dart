import 'dart:convert';
import 'package:basic_flutter_6/model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  ProductModel? productModel;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("http 요청예제"),),
      body: Column(
        children: [
          GestureDetector(
            onTap: () async{
              productModel = await getProductList();
              setState(() {});
            },
            child: Text("요청하기"),
          ),
          Text(productModel?.total.toString()??""),
          Text(productModel?.limit.toString()??""),
          Text(productModel?.skip.toString()??""),
          Text(productModel?.products?.length.toString()??""),
        ],
      ),
    );
  }
}
