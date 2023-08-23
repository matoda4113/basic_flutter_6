import 'package:get/get.dart';

import '../global/HttpService.dart';
import '../model/ProductModel.dart';


///Datacontroller
///담당자 : saran

class DataController extends GetxController {

  final HttpService httpService = HttpService();

  ProductModel? productModel;

  Future<bool> getProductList() async{

    try {
      ProductModel info =await httpService.getProductList();
      productModel = info;
      update();
      return true;

    } catch (error) {
      print(error);
      return false;
    }

  }

}