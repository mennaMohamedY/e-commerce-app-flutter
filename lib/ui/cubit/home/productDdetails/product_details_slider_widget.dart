
import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utiles/colors.dart';

class ProductDetailsSliderWidget extends StatelessWidget {

  List<String> commercialsImgsPathsList=[];
  @override
  Widget build(BuildContext context) {
    commercialsImgsPathsList=commercialsImgsPaths();
    return CarouselSlider(
      options: CarouselOptions(
          height: 200.0,
        aspectRatio: 16/9,
        viewportFraction: 0.99,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
      ),
      items: [0,1,2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,

                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.PrimaryColor),
                   borderRadius: BorderRadius.circular(15.r),
                ),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.asset(commercialsImgsPathsList[i],height:MediaQuery.of(context).size.height,fit:BoxFit.fill,),

                  Padding(padding:EdgeInsets.all(4.h),child:
                  Image.asset(AppAssets.selectedFavouritsTabIconPath)
                  )
                ],),
            );
          },
        );
      }).toList(),
    );
  }
}

List<String> commercialsImgsPaths(){
  return [AppAssets.commercialImgPath1,AppAssets.commercialImgPath2,AppAssets.commercialImgPath3];
}

/*
Image.asset(commercialsImgsPathsList[i],fit:BoxFit.fill,)
 */
