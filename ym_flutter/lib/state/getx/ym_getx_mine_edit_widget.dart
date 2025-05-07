
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ym_flutter/state/getx/ym_getx_mine_Info_controller.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmGetxMineEditWidget extends StatefulWidget{
  const YmGetxMineEditWidget({super.key});
  @override
  State<YmGetxMineEditWidget> createState() => _YmGetxMineEditWidgetState();
}
class _YmGetxMineEditWidgetState extends State<YmGetxMineEditWidget> with YmStyle {
  late YmGetxMineInfoController mineUInfoController;
  @override
  void initState() {
    super.initState();
    mineUInfoController = Get.find<YmGetxMineInfoController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YmGetxMineInfoController>(
        builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: w(40),),
          Text('姓名： ${mineUInfoController.mineInfo.name}',
              style: ts(s: 28, c: const Color(0xFF000000),)),
          SizedBox(height: w(20),),
          GestureDetector(
            onTap: () {
              mineUInfoController.updateUserName("张三");
            },
            child: Text('姓名修改为：张三', style: ts(
                s: 28, c: const Color(0xFF0000FF), fw: FontWeight.bold)),
          ),
          SizedBox(height: w(20),),
          GestureDetector(
            onTap: () {
              mineUInfoController.updateUserAge(28);
            },
            child: Text('年龄修改为：28', style: ts(
                s: 28, c: const Color(0xFF0000FF), fw: FontWeight.bold)),
          ),
          SizedBox(height: w(20),),
          Obx(() => Text("${mineUInfoController.coin.value}")), // 显示 count 的值
          GestureDetector(
            onTap: () {
              mineUInfoController.coin.value = 666;
            },
            child: Text('修改用户金币为：666', style: ts(
                s: 28, c: const Color(0xFF0000FF), fw: FontWeight.bold)),
          )
        ],
      );
    }
    );
  }
}
