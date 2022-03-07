import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lizder/bodys/show_manage_seller.dart';
import 'package:lizder/bodys/show_order_seller.dart';
import 'package:lizder/bodys/show_product_seller.dart';
import 'package:lizder/models/user_model.dart';
import 'package:lizder/utility/my_constant.dart';
import 'package:lizder/widgets/show_progress.dart';
import 'package:lizder/widgets/show_signout.dart';
import 'package:lizder/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellerService extends StatefulWidget {
  const SellerService({Key? key}) : super(key: key);

  @override
  _SellerServiceState createState() => _SellerServiceState();
}

class _SellerServiceState extends State<SellerService> {
  List<Widget> widgets = [];
  int indexwidget = 0;
  UserModel? userModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserModel();
  }

  Future<Null> findUserModel() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String id = preferences.getString('id')!;
    print('## id logged ==> $id');
    String apiGetUserWhereId =
        '${MyConstant.domain}/lizder/getUserWhereId.php?isAdd=true&id=$id';
    await Dio().get(apiGetUserWhereId).then((value) {
      print('## Value ==> $value ');
      for (var item in json.decode(value.data)) {
        setState(() {
          userModel = UserModel.fromMap(item);
          print('## name logged  = ${userModel!.name}');
          widgets.add(ShowOrderSeller());
          widgets.add(ShowManageSeller(userModel: userModel!));
          widgets.add(ShowProductSeller());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seller'),
      ),
      drawer: widgets.length == 0
          ? SizedBox()
          : Drawer(
              child: Stack(
                children: [
                  ShowSignOut(),
                  Column(
                    children: [
                      buildHead(),
                      buildMenuShowOrder(),
                      buildMenuShowManage(),
                      buildMenuShowProduct(),
                    ],
                  ),
                ],
              ),
            ),
      body: widgets.length == 0 ? ShowProgress() : widgets[indexwidget],
    );
  }

  UserAccountsDrawerHeader buildHead() {
    return UserAccountsDrawerHeader(
      otherAccountsPictures: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.change_circle_outlined,
            size: 36,
            color: MyConstant.light,
          ),
          tooltip: 'Edit Shop',
        )
      ],
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [
          MyConstant.light,
          MyConstant.dark,
        ],
        center: Alignment(-0.8, -0.2),
        radius: 0.8,
      )),
      currentAccountPicture: CircleAvatar(
        backgroundImage:
            NetworkImage('${MyConstant.domain}${userModel!.avatar}'),
      ),
      accountName: Text(
        userModel == null ? 'Name ?' : userModel!.name,
        style: MyConstant().h2WhiteStyle(),
      ),
      accountEmail: Text(userModel == null ? 'Type ?' : userModel!.type,
          style: MyConstant().h3WhiteStyle()),
    );
  }

  ListTile buildMenuShowOrder() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 0;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_1_outlined,
        size: 36,
      ),
      title: ShowTitle(title: 'Show Order', textStyle: MyConstant().h2Style()),
      subtitle: ShowTitle(
          title: 'show order details', textStyle: MyConstant().h3Style()),
    );
  }

  ListTile buildMenuShowManage() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 1;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_2_outlined,
        size: 36,
      ),
      title: ShowTitle(title: 'Shop Manage', textStyle: MyConstant().h2Style()),
      subtitle: ShowTitle(
          title: 'shop manage details', textStyle: MyConstant().h3Style()),
    );
  }

  ListTile buildMenuShowProduct() {
    return ListTile(
      onTap: () {
        setState(() {
          indexwidget = 2;
          Navigator.pop(context);
        });
      },
      leading: Icon(
        Icons.filter_3_outlined,
        size: 36,
      ),
      title:
          ShowTitle(title: 'Show Product', textStyle: MyConstant().h2Style()),
      subtitle: ShowTitle(
          title: 'show product details', textStyle: MyConstant().h3Style()),
    );
  }
}
