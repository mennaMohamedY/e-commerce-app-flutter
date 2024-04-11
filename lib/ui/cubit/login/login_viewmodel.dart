
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/use_cases/LoginUseCase.dart';

class LoginViewModel extends Cubit<RegisterStates>{
  static GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();
  TextEditingController emailAddressController=TextEditingController(text: 'menna@rout.com');
  TextEditingController passwordController=TextEditingController(text: '123456');

  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}):super(LoadingState(LoadingMessage: 'Loading...'));

  void Login()async{
    if(loginFormKey.currentState?.validate()==true){

      emit(LoadingState(LoadingMessage: "Loading..."));
      var either=await loginUseCase.Login(emailAddressController.text, passwordController.text);
      either.fold(
              (l) => emit(ErrorState(errorMsg: '${l.errorMsg}')),
              (r) => emit(SucessState(authResponseEntity: r)));
    }

  }
}