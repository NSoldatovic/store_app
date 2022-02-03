class Product {
  final String name;
  final String brand;
  double price;
  Product({required this.name, required this.brand, required this.price});

  double? calculatePrice(double quantity) {
    double totalPrice;
    totalPrice = price * quantity;
    return totalPrice;
  }
}
