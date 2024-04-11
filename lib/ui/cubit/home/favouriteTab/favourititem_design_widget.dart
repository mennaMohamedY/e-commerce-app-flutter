
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/app_assets.dart';

class FavouritItemDesignWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: Container(decoration: BoxDecoration(border: Border.all(color: AppColors.PrimaryColor,),
          borderRadius:BorderRadius.all(Radius.circular(15.r)) ),
        child:Row(children: [
          Expanded(flex:2,child:  Container(clipBehavior: Clip.hardEdge,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.r))),child: Image.asset(AppAssets.commercialImgPath3,height: 130.h, fit: BoxFit.fill,),)),
          SizedBox(width: 12.w,),
          Expanded(flex:5,child: SingleChildScrollView(
            child: Column(children: [
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Text("Product Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),),
                Padding(padding:EdgeInsets.only(right: 9.w),child: Image.asset(AppAssets.favouritItem))
              ],),
              Row(children: [
                Icon(Icons.circle,color: Colors.deepOrange,size: 12,),
                SizedBox(width: 6.w,),
                Text("Orange | size 40",style: TextStyle(color: AppColors.PrimaryColor),)
              ],),
              Padding(padding: EdgeInsets.only(right: 7.w,bottom: 7.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("EGP 1,500",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                  Container(margin:EdgeInsets.symmetric(vertical: 7),padding:EdgeInsets.symmetric(vertical: 7.h,horizontal: 9.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                    child: Text("add to cart",style: TextStyle(color: Colors.white),),)
                ],),
              )
            
            ],),
          )),

        ],)
        ,
      ),
    );
  }
}
