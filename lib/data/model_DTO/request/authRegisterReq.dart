/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmuttijx@gmail.com"
/// password : "Ahmedjx@123"
/// rePassword : "Ahmedjx@123"
/// phone : "01010700700"

class AuthRegisterReq {
  AuthRegisterReq({
      this.name, 
      this.email, 
      this.password, 
      this.rePassword, 
      this.phone,});

  AuthRegisterReq.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }
  String? name;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['rePassword'] = rePassword;
    map['phone'] = phone;
    return map;
  }

}