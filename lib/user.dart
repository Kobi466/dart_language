import 'package:first_app/city.dart';

import 'address.dart';

class User implements City, Address {
  late int id;
  late String name;

  // User(this.id, this.name) : super(18);
  User(this.id, this.name) : super();

  @override
  void showCity() {
    // TODO: implement showCity
    print('Da Nang City');
  }

  @override
  void presentCity() {
    // TODO: implement presentCity
    print('OverRide Binh Dinh Provinde');
  }

  @override
  void showAddress() {
    // TODO: implement showAddress
  }
}
