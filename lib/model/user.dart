class User {
  // int? id;
  // int id = 0;
  //Public
  // late int id;
  // late String name;

  //Private
  int _id = 0;
  String _name = 'Default';

  User(this._id, this._name);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
  // User({this.id = 1, this.name = 'Loi'});

  // User({required this.id, required this.name});

  // User(this.id, [this.name = 'Loi']);

  // User.name(this.id, this.name);
  // User(int id, String name) {
  //   this.id = id;
  //   this.name = name;
  // }

  //getter and setter private field

  void _logInfo() {
    print('Loikobi');
  }

  void logInfo() {
    _logInfo();
  }

  @override
  String toString() {
    return 'User{id: $_id, name: $_name}';
  }
}
