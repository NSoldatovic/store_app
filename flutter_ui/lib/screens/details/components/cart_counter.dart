import 'package:flutter/material.dart';

import '../../../constants.dart';

class CartCounter extends StatefulWidget {
  String category;
  CartCounter({Key? key, required this.category}) : super(key: key);
  @override
  CartCounterState createState() => CartCounterState();
}

class CartCounterState extends State<CartCounter> {
  final amountController = TextEditingController();
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
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
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

  num? amount() {
    return (widget.category == "food")
        ? double.tryParse(amountController as String)
        : numOfItems;
  }

  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return (widget.category == "food") ? food() : notfood();
  }

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
}
