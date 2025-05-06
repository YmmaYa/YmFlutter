
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/animation/ym_animation_style_widget.dart';
import 'package:ym_flutter/animation/ym_animation_viewModel.dart';
import 'package:ym_flutter/common/ym_app_bar_widget.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_log_util.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmAnimationWidget extends StatelessWidget with YmStyle,YmGlobal{
  const YmAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Expanded(
        child: SingleChildScrollView(
          padding:paddingLTRB(40,20,40,0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YmAnimationViewModel().buildItem("隐式 动画",(){YmAnimationViewModel.toPushNextPage(context,"隐式 动画",YmAnimationPages.ymAnimationPageSimple);}),
                  YmAnimationViewModel().buildItem("Hero 动画",(){YmAnimationViewModel.toPushNextPage(context,"Hero 动画",YmAnimationPages.ymAnimationPageHero);}),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  YmAnimationViewModel().buildItem("页面转场动画",(){YmAnimationViewModel.toPushNextPage(context,"页面转场动画",YmAnimationPages.ymAnimationPage);}),
                ],
              ),


            ],
          )
        )

    );
  }

}
