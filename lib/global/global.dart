import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

//로거 설정
Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 3,
    lineLength: 130,
    colors: true,
    printEmojis: false,
    printTime: false,
  ),
);