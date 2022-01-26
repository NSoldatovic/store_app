import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/details/components/body.dart';

import '../../constants.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  final Function addToCart;

  const DetailsScreen(
      {Key? key, required this.product, required this.addToCart})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorTheme,
      appBar: buildAppBar(context),
      body: Body(product: product, addToCart: addToCart),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("${product.name}",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
              letterSpacing: 2)),
      backgroundColor: kColorTheme,
      elevation: 2,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      /* actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {
            print('details Screen');
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ], */
    );
  }
}
