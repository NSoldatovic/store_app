import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/cart.dart';
import 'package:flutter_ui/screens/home/cart/receipt.dart';

import '../../../constants.dart';

class CartScreen extends StatefulWidget {
  final CartClass cartObject;
  const CartScreen({Key? key, required this.cartObject}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void deleteTx(int index) {
    setState(() {
      widget.cartObject.cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kColorTheme,
          elevation: 0,
          title: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPaddin * 3.9),
            child: Text(
              "CART",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  letterSpacing: 3),
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: widget.cartObject.cart.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Container(
                    alignment: Alignment.center,
                    height: constraints.maxHeight * 0.8,
                    child: Image.asset(
                      'assets/images/empty.png',
                      fit: BoxFit.cover,
                    ));
              })
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Image.asset(
                                widget.cartObject.cart[index]['product'].image),
                          ),
                        ),
                      ),
                      title: Text(
                        widget.cartObject.cart[index]['product'].name,
                        // style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(
                          '${widget.cartObject.cart[index]['quantity']} x \$${widget.cartObject.cart[index]['product'].price}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(index),
                      ),
                    ),
                  );
                },
                itemCount: widget.cartObject.cart.length,
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: widget.cartObject.cart.isEmpty
            ? null
            : ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Receipt(cart: widget.cartObject.cart)));
                },
                child: const Text('Print Receipt'),
              ));
  }
}
