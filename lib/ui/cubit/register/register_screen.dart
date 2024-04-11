

import 'package:e_commerce_app/ui/cubit/register/custome_textfield.dart';
import 'package:e_commerce_app/ui/cubit/register/register_states.dart';
import 'package:e_commerce_app/ui/cubit/register/register_viewmodel.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../domain/custom_alertdialog.dart';
import '../../../domain/dependency_injection.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName="RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel registerViewModel =RegisterViewModel( registerUseCase: registerUseCaseInjection());

  TextEditingController fullNameController=TextEditingController(text: "menna");

  @override
  Widget build(BuildContext context) {
    //TextEditingController fullNameController=TextEditingController(text: "menna");

    return BlocListener(
      bloc: registerViewModel,
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
            CustomAlertDialog.ShowCustomeDialog(context: context,
                content: 'success name: \n ${state.authResponseEntity.user?.name}');
          }
        },
      child: Scaffold(
        appBar: AppBar(),
      backgroundColor: AppColors.PrimaryColor,
      body: Container(color: AppColors.PrimaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding:EdgeInsets.only(top: 51.h,left: 97.w,right: 96.w),child: Image.asset('assets/images/routeLogo.png',alignment: Alignment.center,)),
              Form(
                  key:RegisterViewModel.RegisterFormKey ,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //fullName
                      CustomeTextField(textFieldTitle: "Full Name", txtController: registerViewModel.fullNameController, hintText: 'Enter your Full Name',
                          validator: (value){
                            if(value == null || value.trim().isEmpty){

                              return "this field can't be empty";
                            }else{
                              return null;
                            }
                          }),

                      //phoneNum
                      CustomeTextField(textFieldTitle: 'Mobile Number', txtController: registerViewModel.phoneNumController, hintText: 'Enter your phone no.',
                          //keyboardType: TextInputType.phone,
                          validator:(value){
                            if(value==null || value.trim().isEmpty){
                              return "this field can't be empty";
                            }
                            if(value.length<11 || value.length>11){
                              return "num must be 11 digits";
                            }
                            return null;
                          }),

                      //emailAddress
                      CustomeTextField(textFieldTitle: "E-mail Address", txtController: registerViewModel.emailAddressController, hintText: 'Enter your email address',
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
                      CustomeTextField(textFieldTitle: "Password", txtController: registerViewModel.passwordController, hintText: "Enter your password",suffixIcon: Icon(Icons.remove_red_eye_outlined,color:Colors.blueGrey,),
                          validator: (value){
                            if(value==null || value.trim().isEmpty){
                              return "this field can't be empty";
                            }
                            if(value.length<6 || value.length>15){
                              return "Password must be in range 6 to 15 ";
                            }
                            return null;
                          }),

                      //repassword
                      CustomeTextField(textFieldTitle: "Re-enter Password", txtController: registerViewModel.repasswordController, hintText: "Re-Enter your password",  suffixIcon: Icon(Icons.remove_red_eye_outlined),
                          validator: (value){
                            if(value==null || value.trim().isEmpty){
                              return "this field can't be empty";
                            }
                            if(value != registerViewModel.passwordController.text){
                              return 'password mismatch';
                            }
                            return null;
                          }),

                      Padding(padding:EdgeInsets.only(top: 56.h,left: 16.w,right: 16.w,bottom: 89.h),child: ElevatedButton(onPressed: (){

                        registerViewModel.Register();
                      }, child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                        style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 19.h)))
                        ,))


                    ],
                  ))
            ],
          ),
        ),),),);

  }
}
// ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 19.h)))
