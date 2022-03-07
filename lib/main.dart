import 'package:flutter/material.dart';
import 'package:lizder/models/product_model.dart';
import 'package:lizder/state/add_product.dart';
import 'package:lizder/state/add_wallet.dart';
import 'package:lizder/state/authen.dart';
import 'package:lizder/state/buyer_service.dart';
import 'package:lizder/state/create_account.dart';
import 'package:lizder/state/edit_profile_seller.dart';
// import 'package:lizder/state/edit_product.dart';
import 'package:lizder/state/rider_service.dart';
import 'package:lizder/state/seller_service.dart';
import 'package:lizder/state/show_cart.dart';

import 'package:lizder/utility/my_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
List<ProductModel> productModels = [];
final Map<String, WidgetBuilder> map = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/sellerService': (BuildContext context) => SellerService(),
  '/riderService': (BuildContext context) => RiderService(),
  '/addProduct': (BuildContext context) => AddProduct(),
  '/editProfileSeller': (BuildContext context) => EditProfileSeller(),
 
  MyConstant.routeShowCart: (BuildContext context) => ShowCart(),
  MyConstant.routeAddWallet: (BuildContext context) => AddWallet(),
};

String? initialRoute;

Future <Null> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? type = preferences.getString('type');
  print('## type ===> $type');
  if (type?.isEmpty??true) {
    initialRoute = MyConstant.routeAuthen;
    runApp(MyApp());
  } else {
    switch (type) {
              case 'buyer':
                initialRoute = MyConstant.routeBuyerService;
                runApp(MyApp());
                break;
              case 'seller':
                initialRoute = MyConstant.routeSellerService;
                runApp(MyApp());
                break;
              case 'rider':
                initialRoute = MyConstant.routeRiderService;
                runApp(MyApp());
                break;

              default: 
            }
  }

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaterialColor color = MaterialColor(0xff27057f, MyConstant.mapMaterialColor);
    return MaterialApp(
      title: MyConstant.appName,
      routes: map,
      initialRoute: initialRoute,theme: ThemeData(primarySwatch: color),
    );
  }
}
