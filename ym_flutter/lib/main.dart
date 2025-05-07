import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ym_flutter/animation/ym_animation_style_widget.dart';
import 'package:ym_flutter/animation/ym_animation_viewModel.dart';
import 'package:ym_flutter/optimization/ym_optimization_viewmodel.dart';
import 'package:ym_flutter/state/provider/ym_provider_cart_model.dart';
import 'package:ym_flutter/state/ym_state_manager_style_widget.dart';
import 'package:ym_flutter/state/ym_state_manager_viewmodel.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

import 'optimization/ym_optimization_style_widget.dart';

main() async {
  await GetStorage.init(); // 初始化
  runApp(ChangeNotifierProvider(
      create: (context) => YmProviderCartModel(), // 提供购物车数据
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "My Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with YmStyle,YmGlobal {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // 定义 Widget 映射表
  final Map<String, Widget Function()> widgetMap = {
    'YmAnimationStyleStatelessWidget':()=>const YmAnimationStyleStatelessWidget("Flutter 动画", pageType: YmAnimationPages.ymAnimationPageHome),
  };

  // 通过字符串获取 Widget
  Widget getWidgetByName(String name) {
    if(name =="YmAnimationStyleStatelessWidget"){
      return const YmAnimationStyleStatelessWidget("Flutter 动画", pageType:YmAnimationPages.ymAnimationPageHome);
    }else if(name == "YmStateManagerStyleStatelessWidget"){
      return const YmStateManagerStyleStatelessWidget("Flutter 状态管理", pageType:YmStateManagerPages.ymStateManagerPageHome);
    }else if(name == "YmOptimizationStyleStatelessWidget"){
      return const YmOptimizationStyleStatelessWidget("Flutter 性能优化",pageType: YmOptimizationPages.ymOptimizationPageHome);
    }
    if (widgetMap.containsKey(name)) {
      return widgetMap[name]!();
    }
    return const Placeholder(); // 或者返回一个默认 Widget
  }

  @override
  Widget build(BuildContext context) {
    // 使用定义的类型
    const List<PageItem> items = [
      PageItem(name: "Flutter 动画", page: "YmAnimationStyleStatelessWidget", color: Color(0xFF42fbc6)),
      PageItem(name: "Flutter 状态管理", page: "YmStateManagerStyleStatelessWidget", color: Color(0xaa5534DB)),
      PageItem(name: "Flutter 性能优化", page: "YmOptimizationStyleStatelessWidget", color: Color(0xaaFFCD44)),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ScreenUtilInit(
            designSize: const Size(750, 1334),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, widget) {
              return Center(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                          onTap: (){
                            // 跳转到新页面
                            Navigator.push(context,CupertinoPageRoute(builder: (context) => getWidgetByName(item.page)));
                          },
                          child: Container(
                            color: item.color,
                            padding: const EdgeInsets.all(16),
                            child: Text(item.name),
                          )
                      );
                    },
                  )
              );
            }
        )
    );
  }
}

// 定义一个类型来表示您的页面配置
class PageItem {
  final String name;
  final String page;
  final Color color;

  const PageItem({required this.name, required this.page, required this.color});
}


