
import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/ui/cubit/home/profileTab/custome_textfieldprofile.dart';
import 'package:e_commerce_app/ui/cubit/home/profileTab/profiletab_viewmodel.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';

class ProfileTabScreen extends StatelessWidget {


  ProfileTabViewModel profileTabViewModel=ProfileTabViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(padding: EdgeInsets.only(left: 16.w,right: 16.w),
        child:SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 6.h,bottom: 18.h ),child: Image.asset(AppAssets.routeMarkPath),),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                Text("Welcome, Menna",style: TextStyle(color: AppColors.PrimaryColor,fontSize: 19,fontWeight: FontWeight.bold),),
                 InkWell(onTap: (){
                   profileTabViewModel.logout(AppConstants.userToken,context);
                 },
                   child:  Icon(Icons.logout,color: AppColors.PrimaryColor,size: 25,),)]),
              Text("menna@route.com",style: TextStyle(color: AppColors.PrimaryColor),),
              CustomeTextFieldProfile(textFieldTitle: "Your full name", txtController: profileTabViewModel.fullNameController, hintText: "Menna Mohamed Yousef", validator: (value){},suffixIcon: Icon(Icons.edit_note,color: AppColors.PrimaryColor,),),
              SizedBox(height: 6.h,),
              CustomeTextFieldProfile(textFieldTitle: "Your E-mail", txtController: profileTabViewModel.emailAddressController, hintText: "Menna@route.com", validator: (value){},suffixIcon: Icon(Icons.edit_note,color: AppColors.PrimaryColor,),),

              SizedBox(height: 6.h,),
              CustomeTextFieldProfile(textFieldTitle: "Your Password", txtController: profileTabViewModel.passwordController, hintText: "Menna@route.com", validator: (value){},suffixIcon: Icon(Icons.edit_note,color: AppColors.PrimaryColor,),),

              SizedBox(height: 6.h,),
              CustomeTextFieldProfile(textFieldTitle: "Your Mobile number", txtController: profileTabViewModel.phoneNumController, hintText: "Menna@route.com", validator: (value){},suffixIcon: Icon(Icons.edit_note,color: AppColors.PrimaryColor,),),

              SizedBox(height: 6.h,),
              CustomeTextFieldProfile(textFieldTitle: "Your addrss", txtController: profileTabViewModel.addressController, hintText: "Menna@route.com", validator: (value){},suffixIcon: Icon(Icons.edit_note,color: AppColors.PrimaryColor,),),

              SizedBox(height: 12.h,)





            ],),
        ) ,),
    );
  }
}
