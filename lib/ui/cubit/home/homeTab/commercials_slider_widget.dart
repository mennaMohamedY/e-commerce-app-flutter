
import 'package:e_commerce_app/ui/utiles/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommercialsSliderWidget extends StatelessWidget {

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
        enlargeFactor: 0.1,
        scrollDirection: Axis.horizontal,
      ),
      items: [0,1,2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.r),
                  color: Colors.yellow
                ),
              child: Image.asset(commercialsImgsPathsList[i],fit:BoxFit.fill,),
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
