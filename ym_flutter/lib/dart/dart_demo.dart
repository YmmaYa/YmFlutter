
import 'package:ym_flutter/dart/dart_demo1.dart';
import 'package:ym_flutter/dart/dart_demo2.dart';

class DartDemo{

  static DartDemo instance = DartDemo();

  void dartDemoMain() {
    // Dart是值传递还是引用传递？
    DartDemo1.instance.dartDemo1Main();

    // Dart 是不是单线程模型？是如何运行的？
    DartDemo2.instance.test1();
    DartDemo2.instance.fetchData();
    DartDemo2.instance.loadData();
    DartDemo2.instance.isolateTest();


  }

}
