import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/constants.dart';

import 'package:flutter_ui/screens/home/components/body.dart';
import 'package:flutter_ui/cart.dart';

import 'cart/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  CartClass cartObject = CartClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(
        addToCart: cartObject.addElement,
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.grey[50],
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            print('home screen');
            print(cartObject.cart);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => cartScreen(
                          cartObject: cartObject,
                        )));
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
