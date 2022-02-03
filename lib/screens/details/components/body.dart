import 'package:flutter/material.dart';

import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/home/cart/receipt.dart';

import 'description.dart';
import 'product_title_with_image.dart';
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
  String dropdownValue = 'M';
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
        width: 50,
        height: 50,
        child: OutlineButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: press,
          child: Icon(icon),
        ),
      );
    }

    Widget notfood() {
      return Container(
        height: size.height * 0.07,
        child: Row(
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
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
              child: Text(
                numOfItems.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            buildOutlineButton(
                icon: Icons.add,
                press: () {
                  //print(numOfItems);

                  setState(() {
                    numOfItems++;
                  });
                }),
          ],
        ),
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Weight',
                  ))),
          const SizedBox(
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

    Widget clothes() {
      return Column(
        children: [
          Text("Size:"),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: const TextStyle(color: Colors.black87),
            underline: Container(
              height: 2,
              color: Colors.black87,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['XS', 'S', 'M', 'L', 'XL']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.88,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.37),
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  // height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Description(product: product),
                      const SizedBox(height: kDefaultPaddin / 2),
                      //COUTERWITHFAVV
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          (category == "food") ? food() : notfood(),
                          (category == "clothes")
                              ? clothes()
                              : const SizedBox.shrink(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF6464),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                      const SizedBox(height: kDefaultPaddin / 2),
                      //addtocart
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPaddin),
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin:
                                  const EdgeInsets.only(right: kDefaultPaddin),
                              height: 50,
                              width: 58,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: kColorTheme,
                                ),
                              ),
                              child: IconButton(
                                icon: SvgPicture.asset(
                                  "assets/icons/add_to_cart.svg",
                                  color: kColorTheme,
                                ),
                                onPressed: () {
                                  (product.category == 'clothes')
                                      ? product.size = dropdownValue
                                      : null;

                                  widget.addToCart({
                                    'product': product,
                                    'quantity': amount()
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text('Added to cart!'),
                                    duration: Duration(milliseconds: 1500),
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
                                  color: kColorTheme,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Receipt(cart: [
                                                  {
                                                    'product': product,
                                                    'quantity': amount()
                                                  }
                                                ])));
                                  },
                                  child: Text(
                                    "Buy Now".toUpperCase(),
                                    style: const TextStyle(
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
