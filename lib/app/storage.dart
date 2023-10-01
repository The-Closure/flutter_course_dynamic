import 'package:shared_preferences/shared_preferences.dart';

setInStorage(String data)async{
SharedPreferences storage =await SharedPreferences.getInstance();

storage.setString('pure_data', data);

}


getFromStorage()async{
  SharedPreferences storage =await SharedPreferences.getInstance();

return storage.getString('pure_data');
}