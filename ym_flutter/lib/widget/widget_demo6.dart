import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../state/state_demo2.dart';
import 'countdown_text.dart';

class WidgetDemo6Widget extends StatefulWidget {
  const WidgetDemo6Widget({super.key});
  @override
  State createState() => _WidgetDemo6State();
}

class _WidgetDemo6State extends State<WidgetDemo6Widget> {

  @override
  void initState() {
    super.initState();
    print("--------------------- 6 ValueListenableBuilder的使用 ---------------------");
  }
  @override
  Widget build(BuildContext context) {
    print("6 ValueListenableBuilder的使用: ");
    return Scaffold(
      appBar: AppBar(title: const Text("6 ValueListenableBuilder的使用")),
      body: Column(
        children: const [
          CountDownText(),
        ],
      ),
    );
  }
}
