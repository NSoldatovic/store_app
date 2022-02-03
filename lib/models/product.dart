abstract class Product {
  final String name, brand, category, image, id, description;
  double price;
  String size = '';
  Product(
      {required this.name,
      required this.brand,
      required this.price,
      required this.image,
      required this.id,
      required this.description,
      required this.category});

  double? calculatePrice(double quantity) {
    double totalPrice;
    totalPrice = price * quantity;
    return totalPrice;
  }
}
