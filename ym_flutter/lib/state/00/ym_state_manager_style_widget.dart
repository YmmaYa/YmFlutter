
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ym_flutter/common/ym_app_bar_widget.dart';
import 'package:ym_flutter/state/00/ym_state_manager_viewmodel.dart';
import 'package:ym_flutter/state/provider/ym_provider_cart_model.dart';
import 'package:ym_flutter/state/ym_state_manager_viewmodel.dart';
import 'package:ym_flutter/tool/ym_global.dart';

class YmStateManagerStyleStatelessWidget extends StatelessWidget{
  final String title;
  final YmStateManagerPages pageType;
  final Widget rightWidget;
  const YmStateManagerStyleStatelessWidget(this.title,{super.key,required this.pageType,this.rightWidget = const SizedBox()});

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
                        colors: [Color(0xFF6262F9), Color(0xFF8B32E4)],
                      ),
                    ),
                    YmStateManagerViewModel.buildBody(pageType)
                  ]
              ),
            )
    );


  }
}

class YmStateManagerStyleStatefulWidget extends StatefulWidget {
  final String title;
  final YmStateManagerPages pageType;
  const YmStateManagerStyleStatefulWidget(this.title,{Key?key,required this.pageType}):super(key: key);

  @override
  State<StatefulWidget> createState(){
    return  _YmStateManagerStyleStatefulStateWidget();
  }
}
class _YmStateManagerStyleStatefulStateWidget extends State<YmStateManagerStyleStatefulWidget>{
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
                YmStateManagerViewModel.buildBody(widget.pageType)
              ]
          ),
        )
    );
  }
}

