/// email : "ahmedmutti@gmail.com"
/// password : "Ahmed@123"

class AuthLoginRequest {
  AuthLoginRequest({
      this.email, 
      this.password,});

  AuthLoginRequest.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}