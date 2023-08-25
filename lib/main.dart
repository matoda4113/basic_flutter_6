import 'package:basic_flutter_6/controller/DataController.dart';
import 'package:basic_flutter_6/pages/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global/global.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  prefs = await SharedPreferences.getInstance();

  if(prefs.getInt('userAge')==null){
    await prefs.setInt('userAge', 10);
    print("값이 없어서 새로 세팅완료!! ${prefs.getInt('userAge')}");
  }else{
    print("이미 있었음!! ${prefs.getInt('userAge')}");
  }


  Get.put(DataController());
  runApp(const MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      home: MainPage()
    );
  }
}
