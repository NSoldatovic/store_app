import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ItemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPaddin * 0.3),
        decoration: BoxDecoration(
          border: Border.all(
            color: kColorTheme,
            width: 2,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: size.height * 0.154,
              alignment: Alignment.center,
              child: Hero(
                tag: product.id,
                child: Image.asset(product.image),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            //SizedBox(height: 3),
            Row(
              children: [
                const SizedBox(
                  width: kDefaultPaddin * 0.35,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPaddin / 4),
                      child: Text(
                        // products is out demo list
                        product.name,
                        style: const TextStyle(color: kTextLightColor),
                      ),
                    ),
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
