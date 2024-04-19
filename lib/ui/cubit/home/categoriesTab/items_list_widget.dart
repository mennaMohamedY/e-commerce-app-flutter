
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/item_design_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/AllProductsResponseEntity.dart';

class ItemsListWidget extends StatelessWidget {

  List<ProductsDataEntity> productsDataList;
  final void Function(String productId) onAddItemClickListener;
  final void Function(String productId) onAddToFavouritsClickListener;


  //Function onAddItemClickListener;
  ItemsListWidget({required this.productsDataList,required this.onAddItemClickListener,required this.onAddToFavouritsClickListener});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.of(context).size.height*0.9,
      child: Padding(padding: EdgeInsets.only(right: 16.w,top: 24.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 15,mainAxisSpacing: 12,
          childAspectRatio:5/6 ),
          scrollDirection:Axis.vertical,itemBuilder: (context,index){
          return ItemDesignWidget(productData: productsDataList[index], onAddItemClickListener: onAddItemClickListener,onAddToFavouritClickListener: onAddToFavouritsClickListener,);
        },itemCount: productsDataList.length,),
      ),
    );
  }
}
