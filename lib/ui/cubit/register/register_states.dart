
import 'package:e_commerce_app/domain/entities/AuthRegisterResponseEntity.dart';

abstract class RegisterStates{}
class LoadingState extends RegisterStates{
  String LoadingMessage;
  LoadingState({required this.LoadingMessage});
}
class SucessState extends RegisterStates{

  AuthRegisterResponseEntity authResponseEntity;
  SucessState({required this.authResponseEntity});
}
class ErrorState extends RegisterStates{
  String errorMsg;
  ErrorState({required this.errorMsg});
}