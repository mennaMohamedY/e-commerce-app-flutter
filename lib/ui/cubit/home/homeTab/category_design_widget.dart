
import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/CategoriesResponseEntity.dart';

class CategoryDesignWidget extends StatelessWidget {

  DataEntity categoryData;
  CategoryDesignWidget({required this.categoryData});
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(2),
      child: Column(children: [
        Expanded(
          flex: 2,
          child:
          Container(clipBehavior: Clip.antiAlias,decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: AppColors.PrimaryColor,width: 2)), child: Image.network(categoryData.image!,fit: BoxFit.fill,width: 90,height: 90,),),
        ),
        Expanded(flex:1,child: SingleChildScrollView(child: Padding(padding:EdgeInsets.only(top: 4),child: Text('${categoryData.slug}',style: TextStyle(color: AppColors.PrimaryColor,fontSize: 15),textAlign: TextAlign.center,))))
      ],
      ),
    );
  }
}
/*
ClipRRect(child: Image.asset(AppAssets.commercialImgPath3,width: 65,height: 65,fit: BoxFit.fill,),
            borderRadius: BorderRadius.circular(65),)
 */
