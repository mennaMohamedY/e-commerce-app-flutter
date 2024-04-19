
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceClass{
  static late SharedPreferences prefs;

  static inite()async {
   prefs=await SharedPreferences.getInstance();
   return prefs;
    //final SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key,dynamic value)async{
    if(value is int){
      return await prefs.setInt(key, value);
    }else if(value is double){
      // Save an double value to 'decimal' key.
     return await prefs.setDouble(key, value);
    }else if(value is bool){
      // Save an double value to 'decimal' key.
      return await prefs.setBool(key, value);
    }
    else{
      return await prefs.setString(key, value);
    }
  }

  static Object? getData(String key){
     var value = prefs.get(key);
     return value;
  }
  static Future<bool> removeSavedData(String key)async {
    return await prefs.remove(key);
  }


}