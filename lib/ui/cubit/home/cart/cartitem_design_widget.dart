
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/GetCartItemsResponseEntity.dart';
import '../../../utiles/app_assets.dart';

class CartItemDesignWidget extends StatelessWidget {

  GetCartItemsProducts cartItem;
  Function(String productID) onDeleteClickListener;
  Function(String productID,int newQuantity) onDecrementClickListener;
  Function(String productID,int newQuantity) onIncrementClickListener;
  int quantity=1;

  CartItemDesignWidget({required this.cartItem,required this.onDeleteClickListener,required this.onDecrementClickListener,required this.onIncrementClickListener});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 120.h,
      child: Container(margin:EdgeInsets.symmetric(vertical: 12.h),decoration: BoxDecoration(border: Border.all(color: AppColors.PrimaryColor,),
          borderRadius:BorderRadius.all(Radius.circular(15.r)) ),
        child:Column(children: [
          Row(children: [
            Expanded(flex:2,child:  Container(clipBehavior: Clip.hardEdge,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.r))),
              child: Image.network(cartItem.product?.imageCover??'',height: 120.h, fit: BoxFit.fill,),)),
            SizedBox(width: 12.w,),
            Expanded(flex:5,child: Column(children: [
              Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
                Expanded(flex: 5,child: SingleChildScrollView(scrollDirection:Axis.horizontal,child: Text("${cartItem.product?.title}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColors.PrimaryColor),))),
                Expanded(flex: 2,child: Padding(padding:EdgeInsets.only(right: 9.w),child: InkWell(onTap:(){
                  print("product id ${cartItem.product?.id}");
                  print("user id tqrebn ${cartItem.id}");

                  onDeleteClickListener(cartItem.product!.id!);
                },child: Icon(Icons.delete_outlined,color: AppColors.PrimaryColor,))))
              ],),
              Row(children: [
                Icon(Icons.circle,color: Colors.deepOrange,size: 12,),
                SizedBox(width: 6.w,),
                Text("Orange | size 40",style: TextStyle(color: AppColors.PrimaryColor),)
              ],),
              Padding(padding: EdgeInsets.only(right: 7.w,bottom: 7.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text("EGP ${cartItem.price}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 18),),
                  Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(29.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
                    child: Row(children: [
                      IconButton(onPressed: (){
                        if(cartItem.count ==1){
                          onDeleteClickListener(cartItem.product!.id!);
                        }else{
                          quantity=cartItem.count!.toInt()-1;
                          onDecrementClickListener(cartItem.product!.id!,quantity);
                        }
                      }, icon: Icon(Icons.remove_circle_outline,color: Colors.white,)),
                      Text("${cartItem.count}",style: TextStyle(color: Colors.white,fontSize: 19),),
                      IconButton(onPressed: (){
                        quantity=cartItem.count!.toInt()+1;
                        onIncrementClickListener(cartItem.product!.id!,quantity);
                      }, icon: Icon(Icons.add_circle_outline,color: Colors.white,)),


                    ],),)
                ],),
              )

            ],))
          ],)
        ],),
      ),
    );
  }
}
