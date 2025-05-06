
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/animation/ym_animation_style_widget.dart';
import 'package:ym_flutter/animation/ym_hero_animation.dart';
import 'package:ym_flutter/animation/ym_page_animation.dart';
import 'package:ym_flutter/animation/ym_simple_animation.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

import 'animation_widget.dart';

enum YmAnimationPages{
  ymAnimationPageHome,
  ymAnimationPageSimple,
  ymAnimationPageHero,
  ymAnimationPageHeroPhoto,
  ymAnimationPageHeroPhotoDetail,
  ymAnimationPage,
}

class YmAnimationViewModel with YmStyle, YmGlobal{

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

  static Widget buildBody(YmAnimationPages pageType){
    if(pageType == YmAnimationPages.ymAnimationPageHome){
      return const YmAnimationWidget();
    } else if(pageType == YmAnimationPages.ymAnimationPageSimple){
      return const YmSimpleAnimationWidget();
    }else if(pageType == YmAnimationPages.ymAnimationPageHero){
      return  const YmHeroAnimation();
    }else if(pageType == YmAnimationPages.ymAnimationPageHeroPhoto){
      return const YmHeroPhotoWidget();
    }else if(pageType == YmAnimationPages.ymAnimationPage){
      return const YmPageAnimation();
    }
    return const SizedBox();
  }

  static toPushNextPage(BuildContext context,String title,YmAnimationPages type){
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) {
              return YmAnimationStyleStatefulWidget(title, pageType: type);
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