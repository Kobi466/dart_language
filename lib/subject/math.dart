import '../a00.dart';
import '../subject.dart';

mixin Math on A00 implements Subject {
  @override
  void showScore(String name) => print(name);
  void showScoreMath() {
    print('showScoreMath');
  }
}
