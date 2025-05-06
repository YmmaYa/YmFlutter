
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/animation/ym_animation_viewModel.dart';
import 'package:ym_flutter/animation/ym_hero_animation.dart';
import 'package:ym_flutter/animation/ym_simple_animation.dart';

import '../common/ym_app_bar_widget.dart';
import '../tool/ym_global.dart';
import 'animation_widget.dart';


class YmAnimationStyleStatelessWidget extends StatelessWidget{
  final String title;
  final YmAnimationPages pageType;
  const YmAnimationStyleStatelessWidget(this.title,{super.key,required this.pageType});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          width: YmGlobal.bodyWidth,
          height: YmGlobal.bodyHeight,
          color: const Color(0xFFFFFFFF),
          child: Column(
              children: [
                YmAppBarWidget(
                  title: title,
                  titlecolor: const Color(0xFFFFFFFF),
                  leftTap: (){
                    Navigator.pop(context);
                  },
                  bgColor: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF42fbc6), Color(0xFF07a0c1)],
                  ),
                ),
                YmAnimationViewModel.buildBody(pageType)
              ]
          ),
        )
    );
  }

}

class YmAnimationStyleStatefulWidget extends StatefulWidget {
  final String title;
  final YmAnimationPages pageType;
  const YmAnimationStyleStatefulWidget(this.title,{Key?key,required this.pageType}):super(key: key);

  @override
  State<StatefulWidget> createState(){
    return  _YmAnimationStyleStatefulStateWidget();
  }
}
class _YmAnimationStyleStatefulStateWidget extends State<YmAnimationStyleStatefulWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
          width: YmGlobal.bodyWidth,
          height: YmGlobal.bodyHeight,
          color: const Color(0xFFFFFFFF),
          child: Column(
              children: [
                YmAppBarWidget(
                  title: widget.title??"",
                  titlecolor: const Color(0xFFFFFFFF),
                  leftTap: (){
                    Navigator.pop(context);
                  },
                  bgColor: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF42fbc6), Color(0xFF07a0c1)],
                  ),
                ),
                YmAnimationViewModel.buildBody(widget.pageType)
              ]
          ),
        )
    );
  }
}

