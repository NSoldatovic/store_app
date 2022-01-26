import 'package:intl/intl.dart';

class Cashier {
  //final List<Object> cart;
  //final DateTime purchase_dt;

  void _printDate(String? purchaseDt, addForPrint) {
    if (purchaseDt == null) {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final String formatted = formatter.format(now);
      print('Date: $formatted \n');
      addForPrint('Date: $formatted \n');
    } else {
      final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
      final String formatted = formatter.format(DateTime.parse(purchaseDt));
      print('Date: $formatted\n');
      addForPrint('Date: $formatted \n');
    }
  }

  String printReceipt(List<Map> cart, [String? purchaseDt]) {
    List<String> forPrint = [];
    void addForPrint(String add) {
      forPrint.add(add);
    }

    _printDate(purchaseDt, addForPrint);

    print('---Products---');
    forPrint.add('---Products---');
    var subtotal = 0.00;
    var total = 0.00;
    var discount = 0.00;
    for (int i = 0; i < cart.length; i++) {
      print('\n');
      forPrint.add('\n');
      var temp = cart[i]['product'];
      discount +=
          temp.calculateDiscount(cart[i]['quantity'], purchaseDt, addForPrint);
      subtotal += temp.calculatePrice(cart[i]['quantity']);
    }
    print(
        '-----------------------------------------------------------------------\n');
    forPrint.add('----------------------------------------------\n\n');
    print('SUBTOTAL: \$${double.parse((subtotal).toStringAsFixed(2))}');
    forPrint.add('SUBTOTAL: \$${double.parse((subtotal).toStringAsFixed(2))}');
    print('DISCOUNT: -\$${double.parse((discount).toStringAsFixed(2))}\n');
    forPrint
        .add('DISCOUNT: -\$${double.parse((discount).toStringAsFixed(2))}\n');
    total = subtotal - discount;
    print('TOTAL: \$${double.parse((total).toStringAsFixed(2))}');
    forPrint.add('TOTAL: \$${double.parse((total).toStringAsFixed(2))}');
    return forPrint.join('\n');
  }
}
