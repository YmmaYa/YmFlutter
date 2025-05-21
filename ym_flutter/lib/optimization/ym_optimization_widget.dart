

import 'package:flutter/cupertino.dart';
import 'package:ym_flutter/state/ym_state_manager_viewmodel.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

import '../state/00/ym_state_manager_viewmodel.dart';

class YmOptimizationWidget extends StatelessWidget with YmStyle,YmGlobal{
  const YmOptimizationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        child: SingleChildScrollView(
            padding:paddingLTRB(40,20,40,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                YmStateManagerViewModel().buildItem("案例1：购物车(provider)",(){YmStateManagerViewModel.toPushNextPage(context,"案例1：购物车(provider)",YmStateManagerPages.ymStateManagerPageProvider);}),
              ],
            )
        )
    );
  }
}
