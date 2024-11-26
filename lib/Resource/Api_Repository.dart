import 'package:blog_api/Model/User_Model.dart';
import 'package:blog_api/Resource/Api_provider.dart';

class ApiRepository{


  final ApiProvider apiProvideri = ApiProvider();

  Future<List<UserModel>> fatchUserList(){
    return apiProvideri.fatchUserList();
  }
}

class NetworkError extends Error{

}