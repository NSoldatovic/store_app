import 'package:flutter_ui/models/categories.dart';

class CartClass {
  List<Map> cart = [];

  void addElement(Map element) {
    var bool = true;
    int i;
    for (i = 0; i < cart.length; i++) {
      if (element['product'] == cart[i]['product'] &&
          element['product'].size == cart[i]['product'].size) {
        bool = false;
        break;
      }
    }
    if (bool) {
      if (element['product'].category == 'clothes') {
        cart.add({
          'product': Clothes(
            name: element['product'].name,
            brand: element['product'].brand,
            price: element['product'].price,
            image: element['product'].image,
            color: element['product'].color,
            description: element['product'].description,
            id: element['product'].id,
            category: element['product'].category,
            sizeS: element['product'].size,
          ),
          'quantity': element['quantity']
        });
      } else {
        cart.add(element);
      }
    } else {
      cart[i]['quantity'] = cart[i]['quantity'] + element['quantity'];
    }
  }
}
