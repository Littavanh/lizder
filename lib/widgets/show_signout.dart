import 'package:flutter/material.dart';
import 'package:lizder/utility/my_constant.dart';
import 'package:lizder/widgets/show_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowSignOut extends StatelessWidget {
  const ShowSignOut({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(onTap: ()async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.clear().then((value) => Navigator.pushNamedAndRemoveUntil(context, MyConstant.routeAuthen, (route) => false));
        },
          tileColor: MyConstant.dark,
          leading: Icon(
            Icons.exit_to_app,
            size: 36,
            color: Colors.white,
          ),
          title: ShowTitle(
            title: 'Sign Out',
            textStyle: MyConstant().h2WhiteStyle(),
          ),
          subtitle: ShowTitle(
            title: 'Sign Out and Go to Login',
            textStyle: MyConstant().h3WhiteStyle(),
          ),
        ),
      ],
    );
  }
}