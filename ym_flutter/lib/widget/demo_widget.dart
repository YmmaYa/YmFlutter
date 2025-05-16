import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 封装安全执行器
extension SafeState on State {
  void safeSetState(VoidCallback fn) {
    if (mounted) setState(fn);
  }
}

class DemoWidget extends StatefulWidget{
  const DemoWidget({super.key});

  @override
  State<StatefulWidget>createState(){
    return _DemoWidgetState();
  }
}

class _DemoWidgetState extends State<DemoWidget>{
  bool click = false;
  late Timer timer;
  int count = 0;

  @override
  void initState() {
    print("mounted:初始化后变为true");
    super.initState();
  }

  @override
  void dispose() {
    print("mounted:dispose后变为false");
    timer.cancel(); // 清理资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        Text("BuildContext的使用：$count"),
      ],
    );
  }

  // 1. 基础用法
  Future<void> fetchData() async {
    final response = await Future.delayed(const Duration(seconds: 2));
    // 关键检查点
    if (!mounted) return;
    setState(() {
      //数据处理
    });
  }

  // 2. 复合场景处理
  void startPolling() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel(); // 清理资源
        return;
      }
      // 使用
      safeSetState(() => count++);
    });
  }

  //3. 与 BuildContext 的联动
  void showDialogSafely() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;

      // 同时检查context有效性
      final context = this.context;
      if (context.mounted) {
        // showDialog(context: context, ...);
      }
    });
  }
}

// 结合 ChangeNotifier
class MyModel with ChangeNotifier {
  void safeNotify(BuildContext context) {
    if (context.mounted) notifyListeners();
  }
}



