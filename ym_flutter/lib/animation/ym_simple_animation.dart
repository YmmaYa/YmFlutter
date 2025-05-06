
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_log_util.dart';
import 'package:ym_flutter/tool/ym_style.dart';

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
    YmLogUtil.show("来这里了？");
              return   GestureDetector(
                onTap: () {
                  setState(() {
                    click = !click;
                  });
                },
                ///动画容器
                child: AnimatedContainer(
                  ///动画插值器
                  curve: Curves.bounceInOut,
                  ///容器的高度
                  height: click ? YmGlobal.bodyHeight : 100,
                  ///容器的宽度
                  width: click ? YmGlobal.bodyWidth : 100,
                  ///容器的装饰
                  decoration: BoxDecoration(
                    ///背景图片
                      image: const DecorationImage(
                        ///加载资源目录下的图片
                        image: AssetImage('assets/icon_gift.png'), fit: BoxFit.cover, ),
                      ///圆角
                      borderRadius: BorderRadius.all(Radius.circular( click ? YmGlobal.bodyHeight : 0, ))),
                  ///过渡时间
                  duration: Duration(seconds: 2),
                ),
              );
  }
}

