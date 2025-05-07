
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/optimization/ym_optimization_style_widget.dart';
import 'package:ym_flutter/optimization/ym_optimization_widget.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

enum YmOptimizationPages{
  ymOptimizationPageHome,
}

class YmOptimizationViewModel with YmStyle, YmGlobal{

  Widget buildItem(String title,void Function()  callback){
    return Container(
      width: (YmGlobal.bodyWidth-w(20))/2.0 -w(40),
      height: w(60),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: radiusAll(w(10)),
        border: borderAll(c: const Color(0xFF07a0c1), s: w(2)),
      ),
      child: InkWell(
        onTap: callback,
        child: Text(title),
      ),
    );
  }

  static Widget buildBody(YmOptimizationPages pageType){
    if(pageType == YmOptimizationPages.ymOptimizationPageHome){
      return const YmOptimizationWidget();
    }
    return const SizedBox();
  }

  static toPushNextPage(BuildContext context,String title,YmOptimizationPages type){
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) {
              return YmOptimizationStyleStatefulWidget(title, pageType: type);
            })
    );
  }

  ///
  /// 页面跳转：CupertinoPageRoute
  /// 在 Flutter 中，CupertinoPageRoute 是用于实现 iOS 风格（Cupertino）页面转场动画的一个路由类。
  /// 它提供了类似 iOS 的左右滑动返回手势和默认的页面过渡动画效果。以下是关于 CupertinoPageRoute 的详细说明和用法：
  ///
  static pushNextPage(BuildContext context){

  }
}