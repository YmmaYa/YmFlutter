
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetDemo5Widget extends StatefulWidget {
  @override
  _WidgetDemo5State createState() => _WidgetDemo5State();
}

class _WidgetDemo5State extends State<WidgetDemo5Widget> {
  int _counter = 0;
  Timer? _timer;
  @override
  void dispose() {
    _timer?.cancel(); // 页面销毁时取消定时器，防止内存泄漏
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    startCountdown(); // 初始化时启动定时器
    print("Builder的使用:timer start!");
  }
  @override
  Widget build(BuildContext context) {
    print("Builder的使用:build");
    return Scaffold(
      appBar: AppBar(title: const Text("5 Builder的使用")),
      body: Column(
        children: [
          Builder(
            builder: (context) {
              print('5 Builder的使用: 不需要更新的 Text');
              return  Text('不需要更新的 Text ');
            },
          ),
          ElevatedButton(
            onPressed: (){
                _timer?.cancel(); // 取消定时器
              print("Builder的使用:_timer cancel!");
              },
            child: const Text('暂停'),
          ),
          // 使用Builder隔离文本部分
          Builder(
            builder: (context) {
              print('Builder的使用:Text  built');
              return Text('Counter: $_counter');
            },
          ),
        ],
      ),
    );
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        // 每次定时器触发时，更新状态，强制 rebuild
        _counter ++;
      });
    });
  }
}
