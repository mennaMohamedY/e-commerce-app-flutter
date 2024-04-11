/// value : "Ahmedj@123"
/// msg : "Password confirmation is incorrect"
/// param : "password"
/// location : "body"

class ErrorResponseEntity {
  ErrorResponseEntity({
    this.value,
    this.msg,
    this.param,
    this.location,});


  String? value;
  String? msg;
  String? param;
  String? location;


}