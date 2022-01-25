import 'models/categories.dart';

final supply = [
  Perishable(
    name: 'appels',
    brand: 'BrandA',
    category: 'food',
    image: "assets/images/bag_1.png",
    price: 1.5,
    expirationDate: '2021-06-14',
    //expirationDate: DateTime.now().toString(),
  ),
  Perishable(
      name: 'milk',
      brand: 'BrandM',
      category: 'beverage',
      image: "assets/images/bag_1.png",
      price: 0.99,
      expirationDate: '2022-02-02'),
  Clothes(
      name: 'T-shirt',
      brand: 'BrandT',
      category: 'clothes',
      image: "assets/images/bag_1.png",
      price: 15.99,
      color: 'violet',
      size: Size.M),
  Appliance(
      name: 'laptop',
      category: 'appliance',
      brand: 'BrandL',
      image: "assets/images/bag_1.png",
      price: 2345,
      model: 'ModelL',
      productionDate: '2021-03-03',
      weight: 1.125),
];
