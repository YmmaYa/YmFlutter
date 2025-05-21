
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/state/state_demo2.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

import 'package:ym_flutter/state/ym_state_manager_viewmodel.dart';

import '00/ym_state_manager_viewmodel.dart';

class YmStateManagerWidget extends StatelessWidget with YmStyle,YmGlobal{
  const YmStateManagerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: SingleChildScrollView(
        padding:paddingLTRB(40,20,40,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(_createRoute(const StateDemo2Widget()));
              },
              child: const Text('6 ValueListenableBuilder的使用'),
            ),
            YmStateManagerViewModel().buildItem("案例1：购物车(provider)",(){YmStateManagerViewModel.toPushNextPage(context,"案例1：购物车(provider)",YmStateManagerPages.ymStateManagerPageProvider);}),
            YmStateManagerViewModel().buildItem("案例2：个人信息(getx)",(){YmStateManagerViewModel.toPushNextPage(context,"案例2：个人信息(getx)",YmStateManagerPages.ymStateManagerPageGetx);}),
          ],
        )
      )
    );
  }
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

///
/// 状态管理：
///
/// 需要自己 管理 的状态可以分为两种概念类型：应用 (app) 状态 和 短时 (ephemeral) 状态
///
/// 经验原则是: 选择能够减少麻烦的方式
///
/// 应用 (app) 状态: 如果你想在你的应用中的多个部分之间共享一个非短时的状态，
///                 并且在用户会话期间保留这个状态，我们称之为应用状态（有时也称共享状态）
/// 应用状态的一些例子：
///     用户选项
///     登录信息
///     一个社交应用中的通知
///     一个电商应用中的购物车
///     一个新闻应用中的文章已读/未读状态
///
/// 短时 (ephemeral) 状态: 短时状态（有时也称 用户界面 (UI) 状态 或者 局部状态）,
///                       widget 树中其他部分不需要访问这种状态。不需要去序列化这种状态,
///                       需要用的只是一个 StatefulWidget
///
///
