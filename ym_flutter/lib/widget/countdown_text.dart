
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDownText extends StatefulWidget {
  const CountDownText({super.key});
  @override
  State createState() => _CountDownTextState();
}

class _CountDownTextState extends State<CountDownText> {
  final _counterNotifier = ValueNotifier(0);
  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel(); // 页面销毁时取消定时器，防止内存泄漏
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    print("CountDownText: initState!");
    startCountdown(); // 初始化时启动定时器
  }
  @override
  Widget build(BuildContext context) {
    print("CountDownText: build!");
    return ValueListenableBuilder<int>(
      valueListenable: _counterNotifier,
      builder: (context, count, _) {
        print("CountDownText: value变化后，更新Widget！");
        return Text('$count');  // 只有 timeNotifier.value 变化时才重建
      },
    );
  }

  void startCountdown() {
    print("CountDownText: timer start!");
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // 每次定时器触发时，更新状态，强制 rebuild
        _counterNotifier.value ++;
      });
    });
  }
}
