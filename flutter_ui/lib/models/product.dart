class Product {
  final String name, brand, category, image;
  double price;
  String description = dummyText;
  Product(
      {required this.name,
      required this.brand,
      required this.price,
      required this.image,
      required this.category});

  double? calculatePrice(double quantity) {
    double totalPrice;
    totalPrice = price * quantity;
    return totalPrice;
  }
}

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
