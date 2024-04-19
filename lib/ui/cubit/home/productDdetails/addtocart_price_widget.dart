
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/categoriesTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/custom_alertdialog.dart';
import '../../../../domain/entities/AllProductsResponseEntity.dart';
import '../../../utiles/colors.dart';

class AddToCartAndPriceWidget extends StatelessWidget {

  ProductsDataEntity productData;
  // final void Function(String size) onSizeSelected;

  Function(String productId) addProductToCart;

  AddToCartAndPriceWidget({required this.productData, required this.addProductToCart});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(children: [
        Text("Total Price",style: TextStyle(color: AppColors.PrimaryColor),),
        Text("EGP ${productData.price}",style: TextStyle(color: AppColors.PrimaryColor,fontWeight: FontWeight.bold,fontSize: 16),)
      ],),
      InkWell(onTap: (){
        // var viewmodelObject=CategoriesTabViewModel.creatViewModelObject(context).addItemToCart(productData.id!);
        // CustomAlertDialog.ShowCustomeDialog(context: context, content: "added successfully",postitveActionTxt: "Ok",
        //
        // );
        addProductToCart(productData.id!);
      },
        child: Container(padding:EdgeInsets.symmetric(vertical: 12.h,horizontal: 15.w),decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r),border: Border.all(color: AppColors.PrimaryColor),color: AppColors.PrimaryColor),
          child: Row(children: [
            Icon(Icons.add_shopping_cart,color: Colors.white,),
            SizedBox(width: 12.w,),
            Text("Add To Cart",style: TextStyle(color: Colors.white),)],),),
      )
    ],);
  }
}
