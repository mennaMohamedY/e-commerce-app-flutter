

import 'package:e_commerce_app/domain/dependency_injection.dart';
import 'package:e_commerce_app/ui/cubit/home/categoriesTab/cubit/categoriesTabViewModel.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/addtocart_price_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/color_selector_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/product_details_slider_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/productrate_row_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/size_selector_widget.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/titlesTxt_row_widget.dart';
import 'package:e_commerce_app/ui/utiles/colors.dart';
import 'package:e_commerce_app/ui/utiles/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/api_manager/apiConstants.dart';
import '../../../../domain/custom_alertdialog.dart';
import '../../../../domain/entities/AllProductsResponseEntity.dart';
import '../../../../domain/sharedpreferences.dart';
import '../../../utiles/app_assets.dart';
import 'package:read_more_text/read_more_text.dart';

import '../cart/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  static String routeName="ProductDetailsScreen";

  Color SelectedColor=Colors.transparent;
  String SelectedSize='';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

CategoriesTabViewModel categoriesTabViewModel=CategoriesTabViewModel(allProductsUseCase: allProductsUseCaseInjection(), cartUseCase: cartUseCaseInjection(), favouritUseCase: favouritUseCaseInjection());
class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var cartItemsCount='';
  @override
  void initState() {
    super.initState();
    //homeTabViewModel.getCategories();
    cartItemsCount=SharedPreferenceClass.getData(AppConstants.cartItemsCount).toString();

  }
  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings?.arguments as ProductsDataEntity;
    return Theme( data: Theme.of(context).copyWith(
      canvasColor: AppColors.PrimaryColor,
      iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(AppColors.PrimaryColor)))
    ),
      child: Scaffold(
        appBar:
      AppBar(
        leading: BackButton(color: AppColors.PrimaryColor,onPressed: (){
          Navigator.of(context).pop();
        },),
        iconTheme: IconThemeData(color: AppColors.PrimaryColor),
        backgroundColor: Colors.white,title: Text("Product Details",style: TextStyle(color: AppColors.PrimaryColor),),centerTitle: true, actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search,color: AppColors.PrimaryColor,)),
        IconButton(onPressed: (){
          Navigator.pushNamed(context, CartScreen.routeName);
        }, icon: Badge(
          label: Text("${cartItemsCount}"),
            child: Icon(Icons.shopping_cart_outlined,color: AppColors.PrimaryColor,))),

      ],),
      body: Padding(padding: EdgeInsets.only(top: 12.h,left: 16.w,right: 16.w,bottom: 12.h),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ProductDetailsSliderWidget(productData: args),
            SizedBox(height: 24.h,),
            TitlesTextRowWidget(title: "${args.slug}",price: "EGP ${args.price}",),
            SizedBox(height: 12.h,),
            ProductRateRowWidget(productData: args,),
            SizedBox(height: 12.h,),
            Text("Description",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 12.h,),
              ReadMoreText(
               "${args.description}",
                numLines: 2,
                readMoreText: 'Read more',
                readLessText: 'Read less',
              ),
              SizedBox(height: 12.h,),
              Text("Size",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ///sizes
              SizeSelector( sizes: ["Xl","Small","XXL"], selectedSize: widget.SelectedSize, onSizeSelected: (size){
                widget.SelectedSize=size;
                setState(() {

                });
              }),
              SizedBox(height: 12.h,),
              Text("Color",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ///colors
              ColorSelector(colors: [Colors.pink,Colors.deepOrangeAccent,Colors.deepPurple], selectedColor: widget.SelectedColor, onSizeSelected: (color){
                widget.SelectedColor=color;
                setState(() {

                });
              }),
              SizedBox(height: 12.h,),
              AddToCartAndPriceWidget(productData: args,
                addProductToCart: (productId){
                categoriesTabViewModel.addItemToCart(productId);
                CustomAlertDialog.ShowCustomeDialog(context: context, content: "added successfully",postitveActionTxt: "Ok",

                    );
                },
              )




            ],),
        ),
      ),),
    );
  }
}

/*
Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            //sizedbox or give height
            ProductDetailsSliderWidget(),
            Padding(padding:EdgeInsets.all(4.h),child: Image.asset(AppAssets.selectedFavouritsTabIconPath))
          ],),
 */


/*
     SizedBox(height: MediaQuery.of(context).size.height*.11,child:
              SingleChildScrollView(child: Text("${args.description}"),),),
 */