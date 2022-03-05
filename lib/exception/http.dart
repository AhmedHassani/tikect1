import 'dart:io';

class CustomHttpException {
    int stateCode;
    CustomHttpException(this.stateCode){
       switch(stateCode){
         case 404:throw  const HttpException("Not found page");
         case 500:throw  const HttpException("Internal Server Error");
         case 204:throw  const HttpException("No Content");
         case 400:throw  const HttpException("Bad Request");
         case 401:throw  const HttpException("Request Timeout");
         case 408:throw  const HttpException("Unauthorized");
         case 403:throw  const HttpException("403");
       }
    }
}

