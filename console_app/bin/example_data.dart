import 'models/categories.dart';

final cart = <Map>[
  {
    'products': Perishable(
      name: 'appels',
      brand: 'BrandA',
      price: 1.5,
      expirationDate: '2021-06-14',
      //expirationDate: DateTime.now().toString(),
    ),
    'quantity': 2.45,
  },
  {
    'products': Perishable(
        name: 'milk',
        brand: 'BrandM',
        price: 0.99,
        expirationDate: '2022-02-02'),
    'quantity': 3.00
  },
  {
    'products': Clothes(
        name: 'T-shirt',
        brand: 'BrandT',
        price: 15.99,
        color: 'violet',
        size: Size.M),
    'quantity': 2.00
  },
  {
    'products': Appliance(
        name: 'laptop',
        brand: 'BrandL',
        price: 2345,
        model: 'ModelL',
        productionDate: '2021-03-03',
        weight: 1.125),
    'quantity': 1.00
  }
];
