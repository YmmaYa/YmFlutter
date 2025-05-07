
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/state/provider/ym_products_List_widget.dart';
import 'package:ym_flutter/state/provider/ym_provider_cart_widget.dart';
import 'package:ym_flutter/state/ym_state_manager_style_widget.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_log_util.dart';
import 'package:ym_flutter/tool/ym_style.dart';
import 'package:ym_flutter/state/state_manager.dart';

import 'getx/ym_getx_mine_edit_widget.dart';
import 'getx/ym_getx_mine_widget.dart';

enum YmStateManagerPages{
  ymStateManagerPageHome,
  ymStateManagerPageProvider,
  ymStateManagerPageProviderNext,
  ymStateManagerPageGetx,
  ymStateManagerPageGetxNext,
}

class YmStateManagerViewModel with YmStyle, YmGlobal{

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

  static Widget buildBody(YmStateManagerPages pageType){
    if(pageType == YmStateManagerPages.ymStateManagerPageHome){
      return const YmStateManagerWidget();
    }
    else if(pageType == YmStateManagerPages.ymStateManagerPageProvider){
      return const YmProductsListWidget();
    } else if(pageType == YmStateManagerPages.ymStateManagerPageProviderNext){
      return  const YmProviderCartWidget();
    }
    else if(pageType == YmStateManagerPages.ymStateManagerPageGetx){
      return const YmGetxMineWidget();
    }else if(pageType == YmStateManagerPages.ymStateManagerPageGetxNext){

      return const YmGetxMineEditWidget();
    }
    return const SizedBox();
  }

  static toPushNextPage(BuildContext context,String title,YmStateManagerPages type){
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) {
              if(type == YmStateManagerPages.ymStateManagerPageProvider){
                return YmStateManagerStyleStatelessWidget(title, pageType: type,rightWidget: (){
                  return GestureDetector(
                    onTap: (){
                      YmStateManagerViewModel.toPushNextPage(context, "购物车", YmStateManagerPages.ymStateManagerPageProviderNext);
                    },
                    child: const Text('购物车',style: TextStyle(color: Color(0xFFFFFFFF)),),
                  );
                }(),);
              }
              return YmStateManagerStyleStatefulWidget(title, pageType: type);
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