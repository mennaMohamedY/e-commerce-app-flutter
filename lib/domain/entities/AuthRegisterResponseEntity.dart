/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmuttijx@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MGIxMDkyYmU4YjUyMzIzNWE3OWMyYyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzEyMDAxMTcxLCJleHAiOjE3MTk3NzcxNzF9.jbGJbuMW1K7gZhoMJay3__mVfnr6GGORSKqzEmoqFHQ"

class AuthRegisterResponseEntity {
  AuthRegisterResponseEntity({
    this.message,
    this.user,
    //this.statusMsg,
    this.token,});

  String? message;
  UserEntity? user;
  String? token;
  //statusMsg? msg,

}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttijx@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
    this.role,});

  String? name;
  String? email;
  String? role;

}