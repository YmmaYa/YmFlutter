import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/widget/countdown_text.dart';

import '../state/state_demo2.dart';

class StateDemo1Widget extends StatefulWidget {
  const StateDemo1Widget({super.key});
  @override
  State createState() => _StateDemo1WidgetState();
}

class _StateDemo1WidgetState extends State<StateDemo1Widget> {
  final ValueNotifier<int> counter = ValueNotifier(0); // 可监听的数据
  @override
  void initState() {
    super.initState();
    print("--------------------- State状态管理：ValueListenableBuilder ---------------------");
  }
  @override
  Widget build(BuildContext context) {
    print("ValueListenableBuilder：build !!");
    return Scaffold(
      appBar: AppBar(title: const Text("State状态管理：ValueListenableBuilder")),
      body: Column(
        children:  [
          ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (context, value, child) {
              print("ValueListenableBuilder：value 变化 widget重建 !!");
              return Text('Counter: $value'); // 只有 counter.value 变化时重建
            },
          ),

          ElevatedButton(
            onPressed: () => counter.value++, // 修改值，触发重建
            child: const Text('Increment'),
          ),
          ElevatedButton(
            onPressed: (){
              setState(() {});
            }, // 修改值，触发重建
            child: const Text('调用 setState ！！！'),
          )
        ],
      ),
    );
  }
}
