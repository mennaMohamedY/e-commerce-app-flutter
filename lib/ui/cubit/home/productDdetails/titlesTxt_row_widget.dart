
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/material.dart';

class TitlesTextRowWidget extends StatelessWidget {

  String title;
  String price;
  TitlesTextRowWidget({required this.title,required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
      Text(title,style: TextStyle(color: AppColors.PrimaryColor,fontSize: 18,fontWeight: FontWeight.bold),),
      Text("${price}",style: TextStyle(color: AppColors.PrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),)
    ],)
    ;
  }
}
