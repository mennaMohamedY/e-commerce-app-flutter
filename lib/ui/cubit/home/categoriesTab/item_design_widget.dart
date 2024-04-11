

import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/AllProductsResponseEntity.dart';

class ItemDesignWidget extends StatelessWidget {

  ProductsDataEntity productData;
  ItemDesignWidget({required this.productData});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.r)),
        border: Border.all(color: AppColors.PrimaryColor)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Expanded(flex: 4,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            //sizedbox or give height
          Container(clipBehavior: Clip.hardEdge,decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r),
          )),child: Image.network(productData.imageCover??'',fit: BoxFit.fill,width: double.infinity,),),
          Padding(padding:EdgeInsets.all(4.h),child: Image.asset(AppAssets.selectedFavouritsTabIconPath))
        ],),
      ),
      Expanded(flex:1,child: Padding(padding: EdgeInsets.only(left: 6.w,top: 4.h),child: Text("${productData.slug}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.w500,fontSize: 15),))),
      Expanded(flex: 1,
        child: SingleChildScrollView(scrollDirection:Axis.vertical,child:
        Padding(padding: EdgeInsets.only(left: 6.w,right: 6.w),child: Text("${productData.description}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.w500,fontSize: 15),),)),
      ),
        Expanded(flex: 1,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 6.w),child: Row(children: [
            Text("${productData.price} LE",style: TextStyle(color: AppColors.PrimaryColor,)),
            Padding(padding: EdgeInsets.only(left: 4.w),child:Text("old price",style: TextStyle(decoration: TextDecoration.lineThrough,color: AppColors.PrimaryColor),)
              ,)
          ],),),
        ),
        Expanded(flex: 1,
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 4.w),child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
            Row(children: [
              ///hia de
              Text("4.8",style: TextStyle(color: AppColors.PrimaryColor,)),
              Padding(padding: EdgeInsets.only(left: 4.w),child:
              Icon(Icons.star,color: Colors.yellow,)
                ,)
            ],),
              InkWell(onTap:(){},child: Icon(Icons.add_circle,color: AppColors.PrimaryColor,))
          ],),),
        ),
        SizedBox(height: 6.h,)


      ],),);
  }
}
