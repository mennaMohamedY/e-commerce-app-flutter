import 'package:e_commerce_app/data/api_manager/apiConstants.dart';
import 'package:e_commerce_app/domain/sharedpreferences.dart';
import 'package:e_commerce_app/ui/cubit/home/cart/cart_screen.dart';
import 'package:e_commerce_app/ui/cubit/home/home_screen.dart';
import 'package:e_commerce_app/ui/cubit/home/productDdetails/product_detial_screen.dart';
import 'package:e_commerce_app/ui/cubit/login/loginScreen.dart';
import 'package:e_commerce_app/ui/cubit/register/register_screen.dart';
import 'package:e_commerce_app/ui/cubit/splash/splash_screen.dart';
import 'package:e_commerce_app/ui/utiles/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  String route;
  await SharedPreferenceClass.inite();
  var userToken=SharedPreferenceClass.getData(AppConstants.userToken);
  print("userToken ${userToken}");
  if(userToken ==null){
    route=LoginScreen.routeName;
  }else{
    route=HomeScreen.routeName;
  }
  runApp( MyApp(route: route,));
}

class MyApp extends StatelessWidget {
  String route;

   MyApp({super.key,required this.route});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.LightModeTheme,
          initialRoute: route,
          //initialRoute: CartScreen.routeName,
          //initialRoute: ProductDetailsScreen.routeName,
          //initialRoute: HomeScreen.routeName,
          //initialRoute: LoginScreen.routeName,
          //initialRoute: RegisterScreen.routeName,
          //initialRoute: SplashScreen.routeName,
          routes: {
            RegisterScreen.routeName:(context)=>RegisterScreen(),
            SplashScreen.routeName:(context)=>SplashScreen(),
            LoginScreen.routeName:(context)=>LoginScreen(),
            HomeScreen.routeName:(context)=>HomeScreen(),
            ProductDetailsScreen.routeName:(context)=>ProductDetailsScreen(),
            CartScreen.routeName:(context)=>CartScreen(),
          },
        );
      },
    );

  }
}

