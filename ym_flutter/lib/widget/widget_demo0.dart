
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/common/ym_app_bar_widget.dart';
import 'package:ym_flutter/optimization/ym_optimization_viewmodel.dart';

import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/widget/widget_demo5.dart';

class WidgetDemo0Widget extends StatelessWidget{

  const WidgetDemo0Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: YmGlobal.bodyWidth,
          height: YmGlobal.bodyHeight,
          color: const Color(0xFFFFFFFF),
          child: Column(
              children: [
                YmAppBarWidget(
                  title: "Widget Demo0",
                  titlecolor: const Color(0xFFFFFFFF),
                  leftTap: (){
                    Navigator.pop(context);
                  },
                  bgColor: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xA00000FF), Color(0xFF0000FF)],
                  ),
                ),
                Expanded( // 使用 Expanded 分配剩余空间
                  child:ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(_createRoute(WidgetDemo5Widget()));
                          },
                        child: Text('5 Builder的使用'),
                      ),
                    ],
                  )
                ),
              ]
          ),
        )
    );
  }

  Route _createRoute(Widget nextPage) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation){
        return nextPage;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }
}


