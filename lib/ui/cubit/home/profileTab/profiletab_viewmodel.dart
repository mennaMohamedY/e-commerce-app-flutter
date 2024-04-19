
import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/login/loginScreen.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:flutter/cupertino.dart';

class ProfileTabViewModel extends Cubit<RegisterStates>{

  ProfileTabViewModel():super(LoadingState(LoadingMessage: "Loading"));

  TextEditingController fullNameController=TextEditingController(text: "menna mohamed yousef");
  TextEditingController phoneNumController=TextEditingController(text: '01123127732');
  TextEditingController emailAddressController=TextEditingController(text: 'menna@rout.com');
  TextEditingController passwordController=TextEditingController(text: '123456');
  TextEditingController addressController=TextEditingController(text: 'louran,alexandria');

  logout(String key,BuildContext context) {
    SharedPreferenceClass.removeSavedData(key);
    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
  }
}