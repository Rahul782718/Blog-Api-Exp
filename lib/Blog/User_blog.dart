import 'package:blog_api/Blog/User_State.dart';
import 'package:blog_api/Blog/User_event.dart';
import 'package:blog_api/Model/User_Model.dart';
import 'package:blog_api/Resource/Api_Repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  UserBloc():super(UserInital()){
    final ApiRepository apiRepository= ApiRepository();

    on<GetUserList>((event, emit) async {
      try{
        emit(UserLoading());
        final List<UserModel> userList = await apiRepository.fatchUserList();
        emit(UserLoaded(userList: userList));
        if(userList[0].error != null){
          emit(UserError(error: userList[0].error));
        }
      }on NetworkError{
        emit(UserError(error: "Fail to fatch data is yoiur device online "));
      }
    });
  }
}