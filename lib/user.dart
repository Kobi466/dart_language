import 'package:first_app/tunhien.dart';

class User extends TuNhien {
  int id = 1;
  String name = 'loi';

  User(this.id, this.name);

  void show() {
    print(id);
    print(name);
    tinhTongDiem();
  }
}
