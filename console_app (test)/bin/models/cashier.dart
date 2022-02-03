import 'package:intl/intl.dart';

class Cashier {
  //final List<Object> cart;
  //final DateTime purchase_dt;
  var subtotal = 0.00;
  void _printDate([String? purchaseDt]) {
    if (purchaseDt == null) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final String formatted = formatter.format(now);
      print('Date: $formatted \n');
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final String formatted = formatter.format(DateTime.parse(purchaseDt));
      print('Date: $formatted\n');
    }
  }

  void printReceipt(List<Map> cart, [String? purchaseDt]) {
    _printDate(purchaseDt);
    print('---Products---');
    var total = 0.00;
    var discount = 0.00;
    for (int i = 0; i < cart.length; i++) {
      print('\n');
      var temp = cart[i]['products'];
      discount += temp.calculateDiscount(cart[i]['quantity'], purchaseDt);
      subtotal += temp.calculatePrice(cart[i]['quantity']);
    }
    print(
        '-----------------------------------------------------------------------\n');
    print('SUBTOTAL: \$${double.parse((subtotal).toStringAsFixed(2))}');
    print('DISCOUNT: -\$${double.parse((discount).toStringAsFixed(2))}\n');
    total = subtotal - discount;
    print('TOTAL: \$${double.parse((total).toStringAsFixed(2))}');
  }
}
