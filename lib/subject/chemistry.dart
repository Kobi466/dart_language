import 'package:first_app/a00.dart';
import 'package:first_app/subject.dart';

mixin Chemistry on A00 implements Subject {
  @override
  void showScore(String name) => print(name);

  void showScoreChemistry() {
    print('showScoreChemistry');
  }
}
