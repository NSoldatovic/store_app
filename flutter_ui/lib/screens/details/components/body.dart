import 'package:flutter/material.dart';

import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/details/components/add_to_cart.dart';

//import 'add_to_cart.dart';
//import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';
import 'package:flutter_ui/cart.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  final Product product;
  final Function addToCart;
  const Body({Key? key, required this.product, required this.addToCart})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ///Metodeeee
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    final Product product = widget.product;
    String category = product.category;

    final amountController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    ///Metodeee
    ///
    SizedBox buildOutlineButton(
        {required IconData icon, required VoidCallback press}) {
      return SizedBox(
        width: 40,
        height: 32,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
    }

    Widget notfood() {
      return Row(
        children: <Widget>[
          buildOutlineButton(
            icon: Icons.remove,
            press: () {
              if (numOfItems > 1) {
                setState(() {
                  numOfItems--;
                });
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
            child: Text(
              numOfItems.toString().padLeft(2, "0"),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          buildOutlineButton(
              icon: Icons.add,
              press: () {
                print(numOfItems);

                setState(() {
                  numOfItems++;
                });
              }),
        ],
      );
    }

    num? amount() {
      return (category == "food")
          ? double.tryParse(
              (amountController.text.isEmpty) ? '0' : amountController.text)
          : numOfItems.toDouble();
    }

    Widget food() {
      var width = MediaQuery.of(context).size.width;
      return Row(
        children: [
          Container(
              width: width * 0.25,
              child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Weight',
                  ))),
          SizedBox(
            width: 15,
          ),
          Text(
            "KG",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.black54, fontWeight: FontWeight.bold),
          )
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.9,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.37),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      //COUTERWITHFAVV
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          (category == "food") ? food() : notfood(),
                          Container(
                            padding: EdgeInsets.all(8),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF6464),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                      SizedBox(height: kDefaultPaddin / 2),
                      //addtocart
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPaddin),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: kDefaultPaddin),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: Color(0xFFE6B398),
                                ),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/add_to_cart.svg",
                                  color: const Color(0xFFE6B398),
                                ),
                                onPressed: () {
                                  //print('radi');
                                  widget.addToCart({
                                    'product': product,
                                    'quantity': amount()
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: const Text('Added to cart!'),
                                    duration:
                                        const Duration(milliseconds: 1500),
                                  ));

                                  //print(amount());
                                },
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18)),
                                  color: Color(0xFFE6B398),
                                  onPressed: () {},
                                  child: Text(
                                    "Buy  Now".toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
