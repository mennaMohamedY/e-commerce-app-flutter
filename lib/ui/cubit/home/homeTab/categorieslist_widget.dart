
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/CategoriesResponseEntity.dart';
import 'category_design_widget.dart';

class CategoresListWidget extends StatelessWidget {

  List<DataEntity> categoriesResponseData;

  CategoresListWidget({required this.categoriesResponseData});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 250.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 7),
        scrollDirection:Axis.horizontal,itemBuilder: (context,index){
        return CategoryDesignWidget(categoryData: categoriesResponseData[index],);
      },itemCount: categoriesResponseData.length,),
    );
  }
}
