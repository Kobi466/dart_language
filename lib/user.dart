import 'package:first_app/people.dart';
import 'package:first_app/person.dart';

class User extends People {
  late int id;
  late String name;

  // User(this.id, this.name) : super(18);
  User(this.id, this.name) : super();

  void logInfo() {
    // print("Id: $id, Name: $name, Age: $age");
  }

  //required
  @override
  void function() {
    // TODO: implement function
    print('OverRide Function');
  }

  //no required
  @override
  void function2() {
    // TODO: implement function2
    print('OverRide Function2');
  }
}
