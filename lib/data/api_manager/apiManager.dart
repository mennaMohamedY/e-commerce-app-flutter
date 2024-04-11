
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/data/model_DTO/request/authLoginRequest.dart';
import 'package:e_commerce_app/data/model_DTO/request/authRegisterReq.dart';
import 'package:e_commerce_app/data/model_DTO/response/AllProductsResponse.dart';
import 'package:e_commerce_app/data/model_DTO/response/AuthRegisterResponse.dart';
import 'package:e_commerce_app/data/model_DTO/response/CategoriesResponse.dart';
import 'package:e_commerce_app/domain/entities/Failures.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiManager{
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager getInstance(){
    if(_instance == null){
      _instance= ApiManager._();
    }
    return _instance!;

  }

  Future<Either<Failures,AuthRegisterResponse>> register(String fullName,String phoneNum,String email,String passWord,String repassword)async{
    // first we need to check the connectivity becouse if it's not connected then the
    // app won't work
    var connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      var url = Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.registerEndPoint
      );
      var registerJsonObject=AuthRegisterReq(
        email: email,
        name: fullName,
        password: passWord,
        phone: phoneNum,
        rePassword: repassword
      );
      //3mlna .to json flprevious line 3lshan fl upnext line
      //alresponse byhtag body w ana bb3t object ll http flazm yb2a 3ala sort json
      var response=await http.post(url,body: registerJsonObject.toJson());
      print("response isEmpty?${response.body.isEmpty}");
      var body=response.body;
      var json=jsonDecode(body);
      var authResponse=AuthRegisterResponse.fromJson(json);

      if(response.statusCode >=200 && response.statusCode <300){
        //success
        return Right(authResponse);
      }
      else{
        return Left(ServerFailure(errorMsg:
        (authResponse.error==null)?authResponse.message:authResponse.error!.msg));
      }

    } else {

      //no connection
      return Left(NetworkFailure(errorMsg: "No Internet Connection!"));
    }

  }

  Future<Either<Failures,AuthRegisterResponse>> Login(String email,String passWord)async{
    //first we need to check the connectivity becouse if it's not connected then the
    //app won't work
    var connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      var url = Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.loginEndPoint
      );
      var loginJsonObject=AuthLoginRequest(
          email: email,
          password: passWord);
      //3mlna .to json flprevious line 3lshan fl upnext line
      //alresponse byhtag body w ana bb3t object ll http flazm yb2a 3ala sort json
      var response=await http.post(url,body: loginJsonObject.toJson());
      print("response isEmpty?${response.body.isEmpty}");
      var body=response.body;
      var json=jsonDecode(body);
      var authResponse=AuthRegisterResponse.fromJson(json);

      if(response.statusCode >=200 && response.statusCode <300){
        //success
        return Right(authResponse);
      }
      else{
        return Left(ServerFailure(errorMsg:authResponse.message)
        //(authResponse.error==null)?authResponse.message:authResponse.error!.msg)
        );
      }

    } else {

      //no connection
      return Left(NetworkFailure(errorMsg: "No Internet Connection!"));
    }

  }

  Future<Either<Failures,CategoriesResponse>> getCategories()async{
    //first we need to check the connectivity becouse if it's not connected then the
    //app won't work
    var connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      var url = Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.categoriesEndPoint
      );

      //3mlna .to json flprevious line 3lshan fl upnext line
      //alresponse byhtag body w ana bb3t object ll http flazm yb2a 3ala sort json
      var response=await http.get(url);
      print("response isEmpty?${response.body.isEmpty}");
      var body=response.body;
      var json=jsonDecode(body);
      var CategoryResponse=CategoriesResponse.fromJson(json);

      if(response.statusCode >=200 && response.statusCode <300){
        //success
        print('status code is success ${response.statusCode}');
        print('status code is success ${CategoryResponse.data?.length}');

        return Right(CategoryResponse);
      }
      else{
        print('status code is Failure ${response.statusCode}');

        return Left(ServerFailure(errorMsg:CategoryResponse.message)
          //(authResponse.error==null)?authResponse.message:authResponse.error!.msg)
        );
      }

    } else {
      print('status code is Failure ');

      //no connection
      return Left(NetworkFailure(errorMsg: "No Internet Connection!"));
    }
  }
  Future<Either<Failures,CategoriesResponse>> getBrandsApi()async{
    //first we need to check the connectivity becouse if it's not connected then the
    //app won't work
    var connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      var url = Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.brandsEndPoint
      );

      //3mlna .to json flprevious line 3lshan fl upnext line
      //alresponse byhtag body w ana bb3t object ll http flazm yb2a 3ala sort json
      var response=await http.get(url);
      print("response isEmpty?${response.body.isEmpty}");
      var body=response.body;
      var json=jsonDecode(body);
      var CategoryResponse=CategoriesResponse.fromJson(json);

      if(response.statusCode >=200 && response.statusCode <300){
        //success
        print('brands status code is success ${response.statusCode}');
        print('status code is success ${CategoryResponse.data?.length}');

        return Right(CategoryResponse);
      }
      else{
        print('status code is Failure ${response.statusCode}');

        return Left(ServerFailure(errorMsg:CategoryResponse.message)
          //(authResponse.error==null)?authResponse.message:authResponse.error!.msg)
        );
      }

    } else {
      print('status code is Failure ');

      //no connection
      return Left(NetworkFailure(errorMsg: "No Internet Connection!"));
    }

  }

  Future<Either<Failures,AllProductsResponse>> getAllProducts()async{
    //first we need to check the connectivity becouse if it's not connected then the
    //app won't work
    var connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      var url = Uri.https(
          ApiConstants.baseUrl,
          ApiConstants.allProductsEndPoint
      );

      var response=await http.get(url);
      print("response isEmpty?${response.body.isEmpty}");
      var body=response.body;
      var json=jsonDecode(body);
      var allProductsResponse=AllProductsResponse.fromJson(json);

      if(response.statusCode >=200 && response.statusCode <300){
        //success
        print('brands status code is success ${response.statusCode}');
        print('status code is success ${allProductsResponse.data?.length}');

        return Right(allProductsResponse);
      }
      else{
        print('status code is Failure ${response.statusCode}');

        return Left(ServerFailure(errorMsg:allProductsResponse.message)
          //(authResponse.error==null)?authResponse.message:authResponse.error!.msg)
        );
      }

    } else {
      print('status code is Failure ');

      //no connection
      return Left(NetworkFailure(errorMsg: "No Internet Connection!"));
    }

  }



}