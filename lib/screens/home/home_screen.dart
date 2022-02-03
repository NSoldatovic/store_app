import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/constants.dart';

import 'package:flutter_ui/screens/home/components/body.dart';
import 'package:flutter_ui/models/cart.dart';

import 'cart/cart_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  CartClass cartObject = CartClass();

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: buildAppBar(context),
      body: Body(
        addToCart: cartObject.addElement,
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 2,
      leading: IconButton(
        icon: const Icon(Icons.star),
        color: Colors.white,
        //Favorite Screen
        onPressed: () {},
      ),
      title: Text(
        "Store",
        style: Theme.of(context).textTheme.headline5!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 38,
            color: Colors.white,
            letterSpacing: 3),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartScreen(
                          cartObject: cartObject,
                        )));
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
