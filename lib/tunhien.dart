import 'package:first_app/combination.dart';
import 'package:first_app/subject/chemistry.dart';
import 'package:first_app/subject/math.dart';
import 'package:first_app/subject/physic.dart';

import 'a00.dart';

class TuNhien extends A00 with Math, Chemistry, Physic implements Combination {
  @override
  void tinhTongDiem() {
    showScoreChemistry();
    showScoreMath();
    showScorePhysic();
  }
}
