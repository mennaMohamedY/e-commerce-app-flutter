
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/GetFavouritsTabResponseEntity.dart';
import '../../../utiles/app_assets.dart';

class FavouritItemDesignWidget extends StatelessWidget {

  FavouritsDataEntity itemData;
  Function(String productID) onaddItemToCartClickListener;
  Function(String productID) onFavIconClickListener;

  FavouritItemDesignWidget({required this.itemData, required this.onaddItemToCartClickListener,required this.onFavIconClickListener});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: Container(margin:EdgeInsets.symmetric(vertical: 8),decoration: BoxDecoration(border: Border.all(color: AppColors.PrimaryColor,),
          borderRadius:BorderRadius.all(Radius.circular(15.r)) ),
        child:Row(children: [
          Expanded(flex:2,child:  Container(clipBehavior: Clip.hardEdge,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.r))),child: Image.network(itemData.imageCover??'',height:160.h, fit: BoxFit.fill,),)),
          SizedBox(width: 12.w,),
          Expanded(flex:5,child: SingleChildScrollView(

            child: Column(children: [
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Expanded(child: SingleChildScrollView(scrollDirection:Axis.horizontal,child: Text("${itemData.slug}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),))),
                Padding(padding:EdgeInsets.only(right: 9.w),child: InkWell(onTap:(){
                  onFavIconClickListener(itemData.id??'');
                },child: Image.asset(AppAssets.favouritItem)))
              ],),
              Row(children: [
                Icon(Icons.circle,color: Colors.deepOrange,size: 12,),
                SizedBox(width: 6.w,),
                Text("${itemData.quantity}",style: TextStyle(color: AppColors.PrimaryColor),)
              ],),
              Padding(padding: EdgeInsets.only(right: 7.w,bottom: 7.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("EGP ${itemData.price}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                  Container(margin:EdgeInsets.symmetric(vertical: 7),padding:EdgeInsets.symmetric(vertical: 7.h,horizontal: 9.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                    child: InkWell(
                      onTap: (){
                        onaddItemToCartClickListener(itemData.id??'');
                      },
                        child: Text("add to cart",style: TextStyle(color: Colors.white),)),)
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

/*
          Expanded(flex:5,child: SingleChildScrollView(
            child: Column(children: [
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Text("${itemData.slug}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),),
                Padding(padding:EdgeInsets.only(right: 9.w),child: Image.network(itemData.imageCover??''))
              ],),
              Row(children: [
                Icon(Icons.circle,color: Colors.deepOrange,size: 12,),
                SizedBox(width: 6.w,),
                Text("${itemData.quantity}",style: TextStyle(color: AppColors.PrimaryColor),)
              ],),
              Padding(padding: EdgeInsets.only(right: 7.w,bottom: 7.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("EGP ${itemData.price}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                  Container(margin:EdgeInsets.symmetric(vertical: 7),padding:EdgeInsets.symmetric(vertical: 7.h,horizontal: 9.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                    child: Text("add to cart",style: TextStyle(color: Colors.white),),)
                ],),
              )
            
            ],),
          )),

 */