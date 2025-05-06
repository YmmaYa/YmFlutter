import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_flutter/animation/ym_animation_viewModel.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

///
/// Hero（跨页面共享元素）动画：Flutter 中的 Hero widget 实现的动画类型也称为 共享元素过渡 或 共享元素动画。
/// 案例：查看相册详情、点击商品列表显示商品详情、点击用户列表显示用户详情 等
///
/// 实现要点：
/// （1）Hero 动画需要使用两个 Hero widgets 来实现：
///     一个用来在原页面中描述source hero widget，
///     另一个在目标页面中描述 source hero widget。
/// （2）两个 hero widgets 要创建相同的标签tag，为了获得最佳效果，heroes 应该有几乎完全相同的 widget 树。
/// （3）通过推送目标页面到 Navigator 堆栈来触发动画。
///

class YmHeroAnimation extends StatefulWidget {
  const YmHeroAnimation({super.key});
  @override
  State<YmHeroAnimation> createState() => _YmHeroAnimationState();
}

class _YmHeroAnimationState extends State<YmHeroAnimation> with YmStyle{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: paddingLTRB(40,20,40,0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                YmAnimationViewModel().buildItem("案例1:查看相册详情",(){YmAnimationViewModel.toPushNextPage(context,"案例1:查看相册详情",YmAnimationPages.ymAnimationPageHeroPhoto);}),
              ],
            )
          ],
        )
     )
   );
  }
}

///
/// 案例1: 查看相册
///
class YmHeroPhotoWidget extends StatelessWidget{
  const YmHeroPhotoWidget({super.key});
  @override
  Widget build(BuildContext context){
    final List<String> images = [
      'assets/images/01.jpeg',
      'assets/images/02.jpeg',
      'assets/images/03.jpeg',
      'assets/images/04.jpeg',
      'assets/images/05.jpeg',
    ];
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(
          images.length,
              (index) => YmHeroPhotoImage(
            imagePath: images[index],
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return YmHeroPhotoDetailWidget(images:images,defaultIndex: index);
              })
              );
            },
          )
        ),
      ),
    );
  }
}
class YmHeroPhotoImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;
  const YmHeroPhotoImage({super.key, required this.imagePath, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imagePath,
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
    );
  }
}
class YmHeroPhotoDetailWidget extends StatelessWidget with YmGlobal {
  final List<String> images;
  final int defaultIndex;
  const YmHeroPhotoDetailWidget({super.key, required this.images,required this.defaultIndex});
  @override
  Widget build(BuildContext context) {
    // 在build方法内创建PageController并设置初始页面
    final PageController _pageController = PageController(
      initialPage: defaultIndex, // 设置初始显示的页面索引
      viewportFraction: 1.0, // // 每个页面占据完整视口宽度
    );
    return Container(
      width: YmGlobal.bodyWidth,
      height: YmGlobal.bodyHeight,
      color: Colors.transparent,
      child: PageView.builder(
        physics: new AlwaysScrollableScrollPhysics(),//设置滑动模式
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return YmHeroPhotoImage(
              imagePath: images[index],
              onTap: () => Navigator.pop(context),
          );
        },
        itemCount: images.length,
      )
    );
  }
}
