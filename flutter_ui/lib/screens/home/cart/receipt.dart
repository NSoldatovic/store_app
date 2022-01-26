import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/models/cashier.dart';

import '../../../constants.dart';

class Receipt extends StatelessWidget {
  final List<Map> cart;
  const Receipt({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Cashier dragan = Cashier();
    final String forPrint;

    //You have a option to choose purchase date and time if you want or
    //choose null if you want date and time to be now
    //const specifiedPurchaseDatetime = '2021-06-14 12:34:56';
    final specifiedPurchaseDatetime = null;

    forPrint = dragan.printReceipt(cart, specifiedPurchaseDatetime);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColorTheme,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('$forPrint', style: const TextStyle(fontSize: 17)),
        ));
  }
}
