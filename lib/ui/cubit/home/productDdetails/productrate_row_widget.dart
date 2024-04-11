

import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/AllProductsResponseEntity.dart';

class ProductRateRowWidget extends StatelessWidget {

  ProductsDataEntity productData;

  ProductRateRowWidget({required this.productData});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
     Row(children: [
       Container(padding:EdgeInsets.symmetric(vertical: 4,horizontal: 6),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),border: Border.all(color: AppColors.PrimaryColor)),
         child: Text("${productData.sold} Sold"),),
       SizedBox(width: 12.w,),
       Row(children: [Icon(Icons.star,color: Colors.yellow,),Text("4.8 (${productData.ratingsQuantity})",style: TextStyle(fontSize: 15),)],)
     ],),
      Container(padding:EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.h),decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
        child: Row(children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline,color: Colors.white,)),
          Text("1",style: TextStyle(color: Colors.white,fontSize: 20),),
          IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline,color: Colors.white,)),


        ],),),

    ],);
  }
}
