import 'product.dart';

class Perishable extends Product {
  final String expirationDate;
  Perishable(
      {required String name,
      required String brand,
      required String image,
      required String id,
      required double price,
      required String description,
      required this.expirationDate,
      required String category})
      : super(
            brand: brand,
            name: name,
            description: description,
            id: id,
            price: price,
            category: category,
            image: image);
  int _daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  double calculateDiscount(double quantity, purchaseDt, Function addForPrint) {
    final double totalPrice = quantity * price;
    var discount = 0.00;
    addForPrint('$name $brand ');
    addForPrint(
        '$quantity x \$$price = \$${double.parse((totalPrice).toStringAsFixed(2))}');

    final d1 = DateTime.parse(expirationDate);
    DateTime d2;
    (purchaseDt == null)
        ? d2 = DateTime.now()
        : d2 = DateTime.parse(purchaseDt);
    if (d1.year == d2.year && d1.month == d2.month && d1.day == d2.day) {
      discount = price / 2 * quantity;
      addForPrint(
          '#discount 50% -\$${double.parse((discount).toStringAsFixed(2))}');
      return discount;
    }
    final difference = _daysBetween(DateTime.parse(expirationDate), d2);
    if (difference > -5 && difference < 0) {
      discount = price * 0.1 * quantity;
      addForPrint(
          '#discount 10% -\$${double.parse((discount).toStringAsFixed(2))}');
    }
    //The expiration date has expired
    if (difference > 0) {
      discount = price * 0.5 * quantity;
      addForPrint(
          '#discount 50% -\$${double.parse((discount).toStringAsFixed(2))}');
    }

    return discount;
  }
}

enum Size { XS, S, M, L, XL }

class Clothes extends Product {
  final String color;

  Clothes(
      {required String name,
      required String brand,
      required double price,
      required String image,
      required this.color,
      required String description,
      required String id,
      required String category})
      : super(
            brand: brand,
            name: name,
            description: description,
            price: price,
            id: id,
            category: category,
            image: image);

  double calculateDiscount(double quantity, purchaseDt, Function addForPrint) {
    final double totalPrice = quantity * price;
    var discount = 0.00;
    String sizeString = size;
    DateTime d2;
    (purchaseDt == null)
        ? d2 = DateTime.now()
        : d2 = DateTime.parse(purchaseDt);
    addForPrint('$name $brand $sizeString $color');

    addForPrint(
        '$quantity x \$$price = \$${double.parse((totalPrice).toStringAsFixed(2))}');
    if (!(d2.weekday == 7 || d2.weekday == 6)) {
      discount = price * 0.1 * quantity;
      addForPrint(
          '#discount 10% -\$${double.parse((discount).toStringAsFixed(2))}');
    }

    return discount;
  }
}

class Appliance extends Product {
  final String productionDate, model;
  final double weight;
  Appliance(
      {required String name,
      required String brand,
      required double price,
      required this.model,
      required String image,
      required this.productionDate,
      required this.weight,
      required String id,
      required String description,
      required String category})
      : super(
            brand: brand,
            name: name,
            description: description,
            price: price,
            id: id,
            category: category,
            image: image);

  double calculateDiscount(double quantity, purchaseDt, Function addForPrint) {
    final double totalPrice = quantity * price;
    var discount = 0.00;
    DateTime d2;
    (purchaseDt == null)
        ? d2 = DateTime.now()
        : d2 = DateTime.parse(purchaseDt);
    addForPrint('$name $brand $model');
    addForPrint(
        '$quantity x \$$price = \$${double.parse((totalPrice).toStringAsFixed(2))}');
    if (d2.weekday == 7 || d2.weekday == 6 && price > 999) {
      discount = price * 0.05 * quantity;
      addForPrint(
          '#discount 10% -\$${double.parse((discount).toStringAsFixed(2))}');
    }

    return discount;
  }
}
