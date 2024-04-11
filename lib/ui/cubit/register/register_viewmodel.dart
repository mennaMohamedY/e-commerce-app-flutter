


import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/use_cases/register.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends Cubit<RegisterStates>{

  static GlobalKey<FormState> RegisterFormKey=GlobalKey<FormState>();
  RegisterUseCase registerUseCase;
  TextEditingController fullNameController=TextEditingController(text: "menna mohamed yousef");
  TextEditingController phoneNumController=TextEditingController(text: '01123127732');
  TextEditingController emailAddressController=TextEditingController(text: 'menna@rout.com');
  TextEditingController passwordController=TextEditingController(text: '123456');
  TextEditingController repasswordController=TextEditingController(text: '123456');

  RegisterViewModel({required this.registerUseCase}):super(LoadingState(LoadingMessage: "Loading"));

  void Register()async{

    if(RegisterFormKey.currentState?.validate()==true){
      emit(LoadingState(LoadingMessage: 'Loading.......'));
      var response=await registerUseCase.Register(
          fullNameController.text,
          phoneNumController.text,
          emailAddressController.text,
          passwordController.text,
         repasswordController.text
      );
      print("success response");
      response.fold(
              (l) {
            emit(ErrorState(errorMsg: "${l.errorMsg}"));
          },
              (r) {
            emit(SucessState(authResponseEntity: r));
          });
    }
  }


}