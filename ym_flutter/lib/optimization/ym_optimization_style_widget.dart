
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/common/ym_app_bar_widget.dart';
import 'package:ym_flutter/optimization/ym_optimization_viewmodel.dart';

import 'package:ym_flutter/tool/ym_global.dart';

class YmOptimizationStyleStatelessWidget extends StatelessWidget{
  final String title;
  final YmOptimizationPages pageType;
  final Widget rightWidget;
  const YmOptimizationStyleStatelessWidget(this.title,{super.key,required this.pageType,this.rightWidget = const SizedBox()});

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
                  rightWidget: rightWidget,
                  bgColor: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFDE47F), Color(0xFFFFCD44)],
                  ),
                ),
                YmOptimizationViewModel.buildBody(pageType)
              ]
          ),
        )
    );
  }
}

class YmOptimizationStyleStatefulWidget extends StatefulWidget {
  final String title;
  final YmOptimizationPages pageType;
  const YmOptimizationStyleStatefulWidget(this.title,{Key?key,required this.pageType}):super(key: key);

  @override
  State<StatefulWidget> createState(){
    return  _YmOptimizationStyleStatefulWidgetState();
  }
}
class _YmOptimizationStyleStatefulWidgetState extends State<YmOptimizationStyleStatefulWidget>{
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
                YmOptimizationViewModel.buildBody(widget.pageType)
              ]
          ),
        )
    );
  }
}

