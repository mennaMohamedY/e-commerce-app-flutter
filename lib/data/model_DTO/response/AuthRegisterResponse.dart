import 'package:e_commerce_app/data/model_DTO/response/ErrorResponse.dart';
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttijx@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MGIxMDkyYmU4YjUyMzIzNWE3OWMyYyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyMDAxMTcxLCJleHAiOjE3MTk3NzcxNzF9.jbGJbuMW1K7gZhoMJay3__mVfnr6GGORSKqzEmoqFHQ"

class AuthRegisterResponse {
  AuthRegisterResponse({
      this.message, 
      this.user,
    this.statusMsg,
    this.error,
      this.token,});

  AuthRegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    error = json['errors'] != null ? ErrorResponse.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg=json['statusMsg'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;
  ErrorResponse? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg']=statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
    }
    map['token'] = token;
    return map;
  }

  AuthRegisterResponseEntity convertResponsetoEntity(){
    return AuthRegisterResponseEntity(message:message ,token:token ,user:user?.convertToUserEntity() );
  }

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttijx@gmail.com"
/// role : "user"

class User {
  User({
      this.name, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity convertToUserEntity(){
    return UserEntity(name: name,
     email: email,
    role:role );

  }

}