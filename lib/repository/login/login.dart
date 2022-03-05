import 'dart:io';

import 'package:ticket1/Model/login.dart';
import 'package:ticket1/Model/model_http.dart';
import 'package:ticket1/exception/http.dart';
import 'package:ticket1/repository/base.dart';


class LoginRepository extends BaseRepository<LoginModel> {
  //auth
  LoginModel auth(String username, String password) {
    late LoginModel model;
    Future<ModelHttp>  modelHttp = save(
        endpoint: "/api/user/login",
        header: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body:{
          "email": username,
          "password": password,
        }
    );
    modelHttp.then((value){
       if(value.statusCode==200){
          model=LoginModel.fromJson(value.model);
       }else{
           CustomHttpException(value.statusCode);
       }
    });
    return model;
  }
  //



}
