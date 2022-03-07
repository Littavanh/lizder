import 'package:flutter/material.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({ Key? key }) : super(key: key);

  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        title: Text('Add Wallet from '),
      ),
      
    );
  }
}