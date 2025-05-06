
import 'package:flutter/cupertino.dart';

class YmLogUtil {
  static var _separator = "=";
  static var _split = "$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator$_separator";
  static var _title = "Yl-Log";
  static var _isDebug = true;
  static int _limitLength = 800;
  static String _startLine = "$_split$_title$_split";
  static String _endLine = "$_split$_separator$_separator$_separator$_split";

  static void init({String? title, @required bool? isDebug, int? limitLength}) {
    _title = title!;
    _isDebug = isDebug!;
    _limitLength = limitLength ??= _limitLength;
    _startLine = "$_split$_title$_split";
    var endLineStr = StringBuffer();
    var cnCharReg = RegExp("[\u4e00-\u9fa5]");
    for (int i = 0; i < _startLine.length; i++) {
      if (cnCharReg.stringMatch(_startLine[i]) != null) {
        endLineStr.write(_separator);
      }
      endLineStr.write(_separator);
    }
    _endLine = endLineStr.toString();
  }

  static void setShowLog(bool val) {
    _isDebug = val;
  }

  //仅Debug模式可见
  static void d(dynamic obj) {
    //_log(obj.toString());
  }

  static void show(dynamic obj) {
    _log(obj.toString());
  }

  static void showOn(dynamic obj) {
    // _log(obj.toString());
  }

  static void showSocket(dynamic obj) {
    //_log(obj.toString());
  }

  static void showOnChat(dynamic obj) {
    //_log(obj.toString());
  }

  static void showrRepair(dynamic obj) {
    //_log(obj.toString());
  }

  static void showNim(dynamic obj) {
    // _log(obj.toString());
  }

  static void showNeRoom(dynamic obj) {
    // _log(obj.toString());
  }

  static void showHttp(dynamic obj) {
    //_log(obj.toString());
  }

  static void showRoomEvent(dynamic obj, {bool? fuck}) {
    // if (fuck != null && fuck) {
    //   _log(obj.toString());
    // } else {
    //   _log(obj.toString());
    // }
  }

  static void showRoomEvent22(dynamic obj, {bool? fuck}) {
    if (fuck != null && fuck) {
      _log(obj.toString());
    } else {
      _log(obj.toString());
    }
  }

  static void showRoomEvent333(dynamic obj, {bool? fuck}) {
    if (fuck != null && fuck) {
      _log(obj.toString());
    } else {
      _log(obj.toString());
    }
  }

  static void showRoomChat(dynamic obj, {bool? fuck}) {
    // if (fuck != null && fuck) {
    //   _log(obj.toString());
    // } else {
    //   _log(obj.toString());
    // }
  }
  static void showAppInit(dynamic obj, {bool? fuck}) {
    // if (fuck != null && fuck) {
    //   _log(obj.toString());
    // } else {
    //   _log(obj.toString());
    // }
  }

  static void showSdkInit(dynamic obj, {bool? fuck}) {
    // if (fuck != null && fuck) {
    //   _log(obj.toString());
    // } else {
    //   _log(obj.toString());
    // }
  }

  static void showRoomInit(dynamic obj, {bool? fuck}) {
    // if (fuck != null && fuck) {
    //   _log(obj.toString());
    // } else {
    //   _log(obj.toString());
    // }
  }

  static void showRoomAdiuo(dynamic obj) {
    //_log(obj.toString());
  }

  static void showSvga(dynamic obj) {
    //_log(obj.toString());
  }

  static void showListEvent(dynamic obj) {
    //_log(obj.toString());
  }

  static void showPk(dynamic obj) {
    //_log(obj.toString());
  }

  static void showrTan(dynamic obj) {
    //_log(obj.toString());
  }

  static void v(dynamic obj) {
    //_log(obj.toString());
  }

  static void _log(String msg) {
    //print("$_startLine");
    //_logEmpyLine();
    if (msg.length < _limitLength) {
      print(msg);
    } else {
      segmentationLog(msg);
    }
    //_logEmpyLine();
    // print("$_endLine");
  }

  static void segmentationLog(String msg) {
    var outStr = StringBuffer();
    for (var index = 0; index < msg.length; index++) {
      outStr.write(msg[index]);
      if (index % _limitLength == 0 && index != 0) {
        print(outStr);
        outStr.clear();
        var lastIndex = index + 1;
        if (msg.length - lastIndex < _limitLength) {
          var remainderStr = msg.substring(lastIndex, msg.length);
          print(remainderStr);
          break;
        }
      }
    }
  }

  static void _logEmpyLine() {
    print("");
  }
}