
import 'dart:async';
import 'dart:isolate';

import 'package:ym_flutter/dart/dart_demo.dart';

class DartDemo2{
  static DartDemo2 instance = DartDemo2();

  void isolateTest(){
    Isolate.spawn(heavyTask, '参数');
    // 主 Isolate 继续执行
    print('主线程继续运行');
  }
  void heavyTask(String message) {
    print('子 Isolate 处理: $message');
    // 并行计算（无共享内存）
  }

  void loadData() async {
    print('开始加载');
    var data = await fetchData(); // 看似同步，实则是语法糖
    print('数据：$data');          // 实际在微任务中执行
  }

  Future<String> fetchData() {
    return Future(() {
      // 1. 事件队列执行耗时操作
      return '接口返回的数据';
    }).then((data) {
      // 2. 微任务队列处理回调
      print(data);
      return data;
    });
  }

  void test1(){
    print('1. 同步代码');
    // 事件队列
    Future(() => print('6. 事件任务'));
    Timer.run(() => print('7. Timer 事件'));
    // 微任务队列
    scheduleMicrotask(() => print('3. 微任务'));
    Future.microtask(() => print('4. 微任务'));
    // 同步代码继续
    print('2. 同步代码结束');

    ///
    ///   flutter: 1. 同步代码
    ///   flutter: 2. 同步代码结束
    ///   flutter: 3. 微任务
    ///   flutter: 4. 微任务
    ///   flutter: 6. 事件任务
    ///   flutter: 7. Timer 事件
    ///
  }
}