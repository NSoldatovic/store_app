import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_ui/cart.dart';
import 'package:flutter_ui/screens/home/cart/receipt.dart';

class cartScreen extends StatefulWidget {
  final CartClass cartObject;
  const cartScreen({Key? key, required this.cartObject}) : super(key: key);

  @override
  _cartScreenState createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  void deleteTx(int index) {
    setState(() {
      widget.cartObject.cart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE6B398),
          elevation: 0,
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
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
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
                        icon: Icon(Icons.delete),
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
                  print('radi');
                },
                child: Text('Print Receipt'),
              ));
  }
}
