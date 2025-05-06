// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:ym_flutter/common/ym_title_bar.dart';
import 'package:ym_flutter/tool/ym_global.dart';
import 'package:ym_flutter/tool/ym_style.dart';

class YmAppBarWidget extends StatelessWidget with YmStyle {
  final String title;
  final titleWidget;
  final bool isLeft;
  final leftTap;
  final rightWidget;
  final LinearGradient bgColor;
  final Alignment alignment;
  final bool isicon;
  final String lefttitle;
  final Color titlecolor;
  final IconData icon;

  const YmAppBarWidget({
    Key? key,
    this.title = '',
    Widget? this.titleWidget,
    this.isLeft = true,
    this.isicon = true,
    this.leftTap,
    this.lefttitle = "",
    this.titlecolor = YmTitleBar.headerTextColor,
    this.icon = Icons.navigate_before,
    Widget? this.rightWidget,
    this.bgColor = YmStyle.linearTransparent,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: bgColor,
      ),
      child: Column(
        children: [
          SizedBox(height: YmGlobal.appBarHeight),
          PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  width: double.infinity,
                  height: 48,
                  alignment: alignment,
                  child: titleWidget ??
                      Text(
                        title,
                        style: TextStyle(
                          color: titlecolor,
                          fontSize: w(34),
                        ),
                      ),
                ),
                if (isLeft)
                  Positioned(
                    left: 0,
                    child: IgnorePointer(
                      ignoring: false,
                      child:IconButton(
                        icon: isicon
                            ? Icon(
                          icon,
                          color: titlecolor,
                        )
                            : Text(
                          lefttitle,
                          style: TextStyle(
                            color: titlecolor,
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          if (isLeft) {
                            if (YmGlobal.isEmpty(leftTap)) {
                              Navigator.pop(context);
                            } else {
                              leftTap();
                            }
                          }
                        },
                      ),
                    )

                  ),
                Positioned(
                  right: w(32),
                  child: rightWidget ?? Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
