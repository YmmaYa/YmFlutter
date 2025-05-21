
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ym_flutter/state/00/ym_state_manager_viewmodel.dart';
import 'package:ym_flutter/state/getx/ym_getx_mine_Info_controller.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmGetxMineWidget extends StatefulWidget{
  const YmGetxMineWidget({super.key});
  @override
  State<YmGetxMineWidget> createState() => _YmGetxMineWidgetState();
}
class _YmGetxMineWidgetState extends State<YmGetxMineWidget> with YmStyle {
  late YmGetxMineInfoController mineUInfoController;
  @override
  void initState() {
    super.initState();
    mineUInfoController = Get.put(YmGetxMineInfoController()); // 注入控制器
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YmGetxMineInfoController>(
        builder: (controller){
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: w(40),),
              Text('姓名： ${mineUInfoController.mineInfo.name}', style: ts(s: 28, c: const Color(0xFF000000),)),
              SizedBox(height: w(20),),
              Text('年龄： ${mineUInfoController.mineInfo.age}', style: ts(s: 28, c: const Color(0xFF000000),)),
              SizedBox(height: w(20),),
              Text('金币： ${mineUInfoController.coin.value}', style: ts(s: 28, c: const Color(0xFF000000),)),
              SizedBox(height: w(60),),
              GestureDetector(
                onTap: (){
                  YmStateManagerViewModel.toPushNextPage(context, "信息编辑", YmStateManagerPages.ymStateManagerPageGetxNext);
                },
                child:Text('编辑', style: ts(s: 28, c: const Color(0xFF0000FF),fw: FontWeight.bold)),
              )
            ],
          );
        });

  }
}

