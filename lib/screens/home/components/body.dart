import 'package:flutter/material.dart';
import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/example_data.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/screens/details/details_screen.dart';

import 'categorries.dart';
import 'item_card.dart';

class Body extends StatefulWidget {
  final Function addToCart;
  Body({required this.addToCart});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String showCategory = "All";
  var newSupply = supply;

  void changeCategory(String string) {
    newSupply = <Product>[];
    setState(() {
      showCategory = string;
      if (showCategory == "All") {
        //print('aaa');
        newSupply = supply;
      } else {
        for (int i = 0; i < supply.length; i++) {
          if (showCategory.toLowerCase() == supply[i].category) {
            newSupply.add(supply[i]);
          }
        }
      }
    });

    //showCategory = string;
    //print(showCategory);
    //print(newSupply);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Categories(
          changeCategory: changeCategory,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
            child: GridView.builder(
                itemCount: newSupply.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                      product: newSupply[index],
                      press: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              product: newSupply[index],
                              addToCart: widget.addToCart,
                            ),
                          )),
                    )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
