import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YmStyle{
  ///颜色
  static const Color borderColor = Color(0xffBBBBBB);
  static const Color sixColor = Color(0xff666666);
  static const Color whiteColor = Color(0xffffffff); //#白色

  LinearGradient linearColor({Color from = const Color(0xff7776FF), Color to = const Color(0xffAE2CF1), String type = "left"}) =>
      LinearGradient(
        begin: type == 'left' ? Alignment.centerLeft : Alignment.topCenter,
        end: type == 'left' ? Alignment.centerRight : Alignment.bottomCenter,
        colors: <Color>[from, to],
      );

  static const LinearGradient linearTransparent = LinearGradient(
    begin: Alignment(-1.0, 0.0),
    end: Alignment(0.6, 0.0),
    colors: <Color>[Color.fromRGBO(0, 0, 0, 0), Color.fromRGBO(0, 0, 0, 0)],
  );

  ///宽高
  double w(s) => ScreenUtil().setWidth(s);
  double h(s) => ScreenUtil().setHeight(s);
  double f(s) => ScreenUtil().setSp(s);

  ///文字样式
  TextStyle ts(
      {Color c = YmStyle.sixColor,
        double s = 28,
        FontWeight fw = FontWeight.normal,
        double h = 1.2,
        String fontFamily = "",
        TextDecoration td = TextDecoration.none}) =>
      TextStyle(
          color: c,
          fontSize: ScreenUtil().setSp(s),
          fontWeight: fw,
          height: h,
          decoration: td,
          fontFamily: fontFamily == "" ? null : fontFamily);

  /// 边距
  ///
  EdgeInsets paddingAll(double s) => EdgeInsets.all(w(s));
  EdgeInsets paddingLTRB(double ls, double ts, double rs, double bs) => EdgeInsets.fromLTRB(w(ls), w(ts), w(rs), w(bs));
  EdgeInsets paddingLR(double s) => EdgeInsets.fromLTRB(w(s), 0, w(s), 0);
  EdgeInsets paddingTB(double s) => EdgeInsets.fromLTRB(0, w(s), 0, w(s));
  EdgeInsets paddingLT(double ls, double ts) => EdgeInsets.fromLTRB(w(ls), w(ts), w(ls), w(ts));
  EdgeInsets paddingTop(double s) => EdgeInsets.only(top: w(s));
  EdgeInsets paddingLeft(double s) => EdgeInsets.only(left: w(s));
  EdgeInsets paddingBottom(double s) => EdgeInsets.only(bottom: w(s));
  EdgeInsets paddingRight(double s) => EdgeInsets.only(right: w(s));

  /// 边框
  ///
  //全边框
  Border borderAll({Color? c, double s = 1}) => Border.all(color: c ?? YmStyle.borderColor, width: s);

  /// 圆角
  // 上左 上右 圆角 角度必传
  BorderRadius radiusTop(double s) => BorderRadius.only(topLeft: Radius.circular(w(s)), topRight: Radius.circular(w(s)));
  // 下左 下右 圆角 角度必传
  BorderRadius radiusBottom(double s) => BorderRadius.only(bottomLeft: Radius.circular(w(s)), bottomRight: Radius.circular(w(s)));
  // 上左 下左 圆角 角度必传
  BorderRadius radiusLeft(double s) => BorderRadius.only(topLeft: Radius.circular(w(s)), bottomLeft: Radius.circular(w(s)));
  // 上右 下右 圆角 角度必传
  BorderRadius radiusRight(double s) => BorderRadius.only(topRight: Radius.circular(w(s)), bottomRight: Radius.circular(w(s)));
  // 所有圆角 角度必传
  BorderRadius radiusAll(double s) => BorderRadius.all(Radius.circular(w(s)));
}