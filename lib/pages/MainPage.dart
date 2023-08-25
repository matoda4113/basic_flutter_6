import 'package:basic_flutter_6/controller/DataController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../global/global.dart';
import 'SettingPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
        builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: Text("http 요청예제"),),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Image.network('https://cdn.pixabay.com/photo/2023/05/02/21/08/river-7966163_1280.png',fit: BoxFit.cover,),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Get.to(()=>SettingPage());
                },
              ),
            ],
          ),
        ),
        
        body: Column(
          children: [
            GestureDetector(
              onTap: (){
                logger.e(dotenv.env['API_KEY']);
              },
              child: Text("sarantest"),
            ),
            GestureDetector(
              onTap: () {
                controller.getProductList();
              },
              child: Text("요청하기"),
            ),
            if (controller.productModel != null)
              Expanded(
                child: ListView.builder(
                        itemCount:
                            controller.productModel?.products?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Image.network(controller.productModel?.products?[index]?.thumbnail ?? "", width: 50, height: 50, fit: BoxFit.cover,),
                                  SizedBox(width: 10,),
                                  Text(controller.productModel?.products?[index]?.title ?? ""),
                                ],
                              ));
                        }),
              ),
          ],
        ),
      );
    });
  }
}
