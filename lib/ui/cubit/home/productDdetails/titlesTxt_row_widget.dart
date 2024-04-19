
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:read_more_text/read_more_text.dart';

class TitlesTextRowWidget extends StatelessWidget {

  String title;
  String price;
  TitlesTextRowWidget({required this.title,required this.price});
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children: [
     
     Expanded(flex:8,child:
     SingleChildScrollView(
       scrollDirection: Axis.horizontal,
         child: Text(title,style: TextStyle(color: AppColors.PrimaryColor,fontSize: 18,fontWeight: FontWeight.bold),))),
     SizedBox(width: 12.w,)
    ,Expanded(flex:2,child: Text("${price}",style: TextStyle(color: AppColors.PrimaryColor,fontSize: 16,fontWeight: FontWeight.bold),))
    ],)
    ;
  }
}
