class CartClass {
  List<Map> cart = [];

  void addElement(Map element) {
    var bool = true;
    int i;
    for (i = 0; i < cart.length; i++) {
      if (element['product'] == cart[i]['product']) {
        bool = false;
        break;
      }
    }
    if (bool) {
      cart.add(element);
    } else {
      cart[i]['quantity'] = cart[i]['quantity'] + element['quantity'];
    }
  }
}
