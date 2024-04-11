
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomeTextField extends StatelessWidget {

  String textFieldTitle;
  TextEditingController txtController;
  String hintText;
  Widget? suffixIcon;
  bool obsecureText=false;
  //TextInputType? keyboardType;
  String? Function(String?)? validator;


  CustomeTextField({required this.textFieldTitle,required this.txtController,
  required this.hintText,this.suffixIcon, this.obsecureText=false,
  required this.validator,
   // this.keyboardType=TextInputType.text
  });
  @override
  Widget build(BuildContext context) {
    return
      Padding(padding: EdgeInsets.symmetric(horizontal:16.w ),child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,children: [
        Padding(padding:EdgeInsets.only(top: 32.h,bottom: 24.h),child: Text(textFieldTitle,
          style: TextStyle(fontSize: 18,color: Colors.white),)),
        TextFormField(style: TextStyle(color: Colors.black,),
          controller: txtController,decoration: InputDecoration(hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(width: 1,color: Colors.redAccent)),
            errorStyle: TextStyle(color: Colors.redAccent,fontSize: 16),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(color: Colors.redAccent,width: 1)),
            suffixIcon:suffixIcon,
          ),
          obscureText: obsecureText,
          validator: validator,
          //keyboardType: keyboardType,
        )
      ],
      ),);
  }
}

/*
      Padding(padding: EdgeInsets.symmetric(horizontal:16.w ),child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,children: [
      Padding(padding:EdgeInsets.only(top: 32.h,bottom: 24.h),child: Text(textFieldTitle,
      style: TextStyle(fontSize: 18,color: Colors.white),)),
      TextFormField(style: TextStyle(color: Colors.black,),
      controller: txtController,decoration: InputDecoration(hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(width: 1,color: Colors.redAccent)),
          errorStyle: TextStyle(color: Colors.redAccent,),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Colors.redAccent,width: 1)),
          suffixIcon:suffixIcon,
             ),
        obscureText: obsecureText,
        validator: validator,
        //keyboardType: keyboardType,
      )
    ],
    ),);

 */
/*
      Padding(padding: EdgeInsets.symmetric(horizontal:16.w ),child: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,children: [
        Padding(padding:EdgeInsets.only(top: 32.h,bottom: 24.h),child: Text(textFieldTitle,
          style: TextStyle(fontSize: 18,color: Colors.white),)),
        TextFormField(
          validator: validator,
          decoration: InputDecoration(
            labelText:textFieldTitle,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
              ,borderSide:BorderSide(width: 2,
                  color:Color(0xff2A333C) ) ,),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                ,borderSide:BorderSide(width: 2,
                    color:Color(0xff2A333C)) ),
            labelStyle: TextStyle(color:
            Color(0xff2A333C) ,fontSize: 15 ),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                ,borderSide:BorderSide(width: 2,color:Colors.red ) ),
            errorStyle: TextStyle(color: Colors.red),
            focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)
                ,borderSide:BorderSide(width: 2,color:Colors.red ) ),
          ),
          style: TextStyle(color: Color(0xff2A333C) ),
          controller: txtController,
          obscureText:false,

        )
      ],
      ),);

 */
