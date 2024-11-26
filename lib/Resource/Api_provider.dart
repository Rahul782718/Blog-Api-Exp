import 'package:blog_api/Model/User_Model.dart';
import 'package:dio/dio.dart';

class ApiProvider {


  Dio dio  = Dio();

  String _url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<UserModel>> fatchUserList () async{
    try{
      Response response = await dio.get(_url);
      List<dynamic> value = response.data;
      return value.map((e) => UserModel.fromJson(e)).toList();
    } catch (e){
      if(e.toString().contains("SocketException")){
        return [UserModel.withError("Check Your internet connection please ")];
      }
      return [UserModel.withError(e.toString())];
    }
  }
}