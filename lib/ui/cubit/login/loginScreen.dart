
import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/home/home_screen.dart';
import 'package:e_commerce_app/ui/cubit/login/login_viewmodel.dart';
import 'package:e_commerce_app/ui/cubit/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/custom_alertdialog.dart';
import '../../utiles/colors.dart';
import '../register/custome_textfield.dart';
import '../register/register_states.dart';

class LoginScreen extends StatefulWidget {

  static String routeName="LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel=LoginViewModel(loginUseCase: loginUseCaseInjection());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: loginViewModel,
      listener:(context,state){
        if(state is LoadingState){
          CustomAlertDialog.ShowLoading(context, state.LoadingMessage);
        }
        else if(state is ErrorState){
          CustomAlertDialog.HideDialog(context);
          CustomAlertDialog.ShowCustomeDialog(context: context,
              content: "${state.errorMsg}");
        }
        else if(state is SucessState){
          CustomAlertDialog.HideDialog(context);
          SharedPreferenceClass.saveData(AppConstants.userToken, state.authResponseEntity.token);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          // CustomAlertDialog.ShowCustomeDialog(context: context,
          //     content: 'success name: \n ${state.authResponseEntity.user?.name}');
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.PrimaryColor,
        body: Container(color: AppColors.PrimaryColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(padding:EdgeInsets.only(top: 91.h,left: 97.w,right: 96.w),child: Image.asset('assets/images/routeLogo.png',alignment: Alignment.center,)),
            Padding(padding:EdgeInsets.only(top: 87.h,left: 16.w,bottom: 8.h),child: Text("Welcome Back To Route",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Colors.white),)),
                Padding(padding:EdgeInsets.only(left: 16.w,bottom: 8.h),child: Text("Please Sign in with your mail",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),)),

                Form(
                    key:LoginViewModel.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //emailAddress
                        CustomeTextField(textFieldTitle: "E-mail Address", txtController: loginViewModel.emailAddressController, hintText: 'Enter your email address',
                            validator:(value){
                              if(value==null || value.trim().isEmpty){
                                return "this field can't be empty";
                              }
                              final bool emailValid =
                              RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if(!emailValid){
                                'Invalid email address';
                              }
                              return null;
                            }),
                        //password
                        CustomeTextField(textFieldTitle: "Password", txtController: loginViewModel.passwordController, hintText: "Enter your password",suffixIcon: Icon(Icons.remove_red_eye_outlined,color:Colors.blueGrey,),
                            validator: (value){
                              if(value==null || value.trim().isEmpty){
                                return "this field can't be empty";
                              }
                              if(value.length<6 || value.length>15){
                                return "Password must be in range 6 to 15 ";
                              }
                              return null;
                            }),
                        Padding(padding:EdgeInsets.only(top: 16.h,right: 15.w),child: Text("Forgot password",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.end,)),


                        Padding(padding:EdgeInsets.only(top: 56.h,left: 16.w,right: 16.w),child: ElevatedButton(onPressed: (){

                          loginViewModel.Login();
                        }, child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 19.h)))
                          ,)),
                        InkWell(onTap: (){
                          //Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                            child: Padding(padding:EdgeInsets.only(top: 32.h,right: 15.w,bottom: 89.h),child: Text("Don't have an account? create account",style: TextStyle(fontSize: 18,color: Colors.white),textAlign: TextAlign.center,))),





                      ],
                    ))
              ],
            ),
          ),),),);
  }
}
