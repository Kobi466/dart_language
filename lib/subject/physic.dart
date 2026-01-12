import 'package:first_app/subject.dart';

import '../a00.dart';

mixin Physic on A00 implements Subject {
  @override
  void showScore(String name) => print(name);
  void showScorePhysic() {
    print('showScorePhysic');
  }
}
