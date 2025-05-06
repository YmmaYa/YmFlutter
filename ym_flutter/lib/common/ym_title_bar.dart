
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YmTitleBar {
  static const LinearGradient headerLiner = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[Colors.transparent, Colors.transparent],
  );
  static const Color headerTextColor = Color(0x00000000);

  static appbar(
      BuildContext context, {
        String title = "",
        Widget? titleWidget,
        bool isLeft = true,
        Function? leftFun,
        String rigTit = "",
        Widget? rightWidget,
        Function? rigTap,
        String backgroundImage = '',
        Color? titleColor,
        LinearGradient? headerBackgroundLiner,
      }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: AppBar(
        title: titleWidget ??
            Text(
              title,
              style: TextStyle(
                color: titleColor ?? headerTextColor,
                fontSize: 17,
              ),
            ),
        centerTitle: true,
        // leadingWidth:10,
        leading: isLeft
            ? IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: titleColor ?? headerTextColor,
          ),
          onPressed: (){
            if(leftFun == null){
              Navigator.pop(context);
            }else{
              leftFun();
            }
          },
        )
            : null,
        automaticallyImplyLeading: isLeft, // 隐藏返回按钮
        actions: rigTit != "" || rightWidget != null
            ? <Widget>[
          rightWidget ??
              InkWell(
                onTap: () {
                  rigTap!();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    rigTit,
                    style: TextStyle(
                      color: titleColor ?? headerTextColor,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
        ]
            : null,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: backgroundImage == ''
              ? BoxDecoration(
            gradient: headerBackgroundLiner ?? headerLiner,
          )
              : BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}