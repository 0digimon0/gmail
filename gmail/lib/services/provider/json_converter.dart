import 'package:flutter/services.dart';

class JsonProvider {
  static Future<String> loadAStudentAsset() async {
    print("JsonProvider loadAStudentAsset");
    return await rootBundle.loadString('assets/json/mail_label.json');
  }
}
