import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  //when save an another location add it to temp list and to prefs
  static late SharedPreferences sharedPreferences;
  static initCashHelper() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static List<String>? getData(String key) {
    return sharedPreferences.getStringList(key)??[];
   
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
   
    return await sharedPreferences.setStringList(key, value);
    
  }
}
