// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class MyConstant {
  // General
  static String appName = 'Lizder';
  static String domain = 'http://2661-103-151-76-45.ngrok.io';

  //Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeBuyerService = '/buyerService';
  static String routeSellerService = '/sellerService';
  static String routeRiderService = '/riderService';
  static String routeAddProduct = '/addProduct';
  static String routeEditProfileSeller = '/editProfileSeller';
  // static String routeEditProduct = '/editProduct';
  static String routeShowCart = '/showCart';
  static String routeAddWallet = '/addWallet';

  //Image
  static String image1 = 'images/image1.png';
  static String image2 = 'images/image2.png';
  static String image3 = 'images/image3.png';
  static String image4 = 'images/image4.png';
  static String image5 = 'images/image5.png';
  static String avatar = 'images/avatar.png';
  //Color

  static Color primary = Color(0xff5d34af);
  static Color dark = Color(0xff27057f);
  static Color light = Color(0xff9061e2);
  static Map<int, Color> mapMaterialColor = {
    50: Color.fromRGBO(255, 39, 5, 0.1),
    100: Color.fromRGBO(255, 39, 5, 0.2),
    200: Color.fromRGBO(255, 39, 5, 0.3),
    300: Color.fromRGBO(255, 39, 5, 0.4),
    400: Color.fromRGBO(255, 39, 5, 0.5),
    500: Color.fromRGBO(255, 39, 5, 0.6),
    600: Color.fromRGBO(255, 39, 5, 0.7),
    700: Color.fromRGBO(255, 39, 5, 0.8),
    800: Color.fromRGBO(255, 39, 5, 0.9),
    900: Color.fromRGBO(255, 39, 5, 1.0),
  };

//background
  BoxDecoration planBackground() => BoxDecoration(
        color: MyConstant.light.withOpacity(0.75),
      );

  BoxDecoration gradintLinearBackground() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, MyConstant.light, MyConstant.primary],
        ),
      );

  BoxDecoration gradientRadioBackground() => BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(0, -0.5),
          radius: 1.5,
          colors: [Colors.white, MyConstant.primary],
        ),
      );

  // Style
  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 18,
        color: dark,
        fontWeight: FontWeight.w700,
      );
  TextStyle h1SWhitetyle() => TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
  TextStyle h2WhiteStyle() => TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );
  TextStyle h3WhiteStyle() => TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      );
  TextStyle h2RedStyle() => TextStyle(
        fontSize: 18,
        color: Colors.red.shade700,
        fontWeight: FontWeight.w700,
      );

  TextStyle h2BlueStyle() => TextStyle(
        fontSize: 18,
        color: Colors.blue.shade800,
        fontWeight: FontWeight.w700,
      );

  ButtonStyle myButtonStyle() => ElevatedButton.styleFrom(
        primary: MyConstant.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      );
}
