
import 'package:coffee/core/config/get_it.dart';
import 'package:coffee/core/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService {
  Dio dio =Dio() ;
  String baseURL = 'https://dummyjson.com/auth/login';


login(UserModel user);


}

class AuthServiceImpl extends AuthService {
  @override
  login(UserModel user)async {
    print(user.toJson());
   Response response = await dio.post(baseURL,data: user.toJson());

   if(response.statusCode == 200){
    print(response.data);
    String token =response.data['token'];
    storage.get<SharedPreferences>().setString('token', token);
    return true;
   }
   else{
    print('Error');
    return false;
   }
  }


}