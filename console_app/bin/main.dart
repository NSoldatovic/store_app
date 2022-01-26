import './models/cashier.dart';
import 'example_data.dart';
import './example_data.dart';

void main() {
  Cashier dragan = Cashier();

  //You have a option to choose purchase date and time if you want or
  //choose null if you want date and time to be now
  //final specifiedPurchaseDatetime = '2021-06-14 12:34:56';
  final specifiedPurchaseDatetime = null;

  dragan.printReceipt(cart, specifiedPurchaseDatetime);
}
