
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_log_util.dart';
import 'package:ym_flutter/tool/ym_style.dart';
import 'package:ym_flutter/widget/demo_widget.dart';

class YmSimpleAnimationWidget extends StatefulWidget{
  const YmSimpleAnimationWidget({super.key});

  @override
  State<StatefulWidget>createState(){
    return _YmSimpleAnimationStateWidget();
  }
}

class _YmSimpleAnimationStateWidget extends State<YmSimpleAnimationWidget> with YmGlobal,YmStyle{
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(child:  Stack(
      children: [
        // GestureDetector(
        //   onTap: (){
        //     setState(() {
        //       click = !click;
        //     });
        //   },
        //   child: Text("进场动画"),
        // ),
        // const SizedBox(height: 20),
        DemoWidget()
      ],
    ));
  }
}

