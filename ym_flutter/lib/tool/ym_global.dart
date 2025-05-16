import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

bool isEmpty(parpams) {
  if (parpams == null || parpams == false || parpams == "null") {
    return true;
  }
  if (parpams is String) {
    if (parpams == '') {
      return true;
    } else {
      return false;
    }
  }

  if (parpams is int) {
    if (parpams == 0) {
      return true;
    } else {
      return false;
    }
  }

  if (parpams is List) {
    if (parpams.length == 0) {
      return true;
    } else {
      return false;
    }
  }
  if (parpams is Map) {
    if (parpams.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
  return false;
}

class YmGlobal{
  static double bodyWidth = Get.width;
  static double bodyHeight = Get.height;
  static double appBarHeight = MediaQueryData.fromWindow(window).padding.top;
  static double bottomHeight = MediaQueryData.fromWindow(window).padding.bottom;
  static var overlayEntry = null;

  static bool isEmpty(parpams) {
    if (parpams == null || parpams == false || parpams == "null") {
      return true;
    }
    if (parpams is String) {
      if (parpams == '') {
        return true;
      } else {
        return false;
      }
    }

    if (parpams is int) {
      if (parpams == 0) {
        return true;
      } else {
        return false;
      }
    }

    if (parpams is List) {
      if (parpams.length == 0) {
        return true;
      } else {
        return false;
      }
    }
    if (parpams is Map) {
      if (parpams.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }
}

// 数据格式化global
class Data {
  static int ints(i) {
    if (isEmpty(i)) {
      return 0;
    }
    if (i is int) {
      return i;
    }
    if (i is double) {
      return double.parse(i.toString()).truncate();
      return i.toInt();
    }
    if (i is String) {
      if (i == "null" || i == "false" || i == "") {
        return 0;
      }
      return double.parse(i.toString()).truncate();
    }
    if (i is bool) {
      if (i == false) {
        return 0;
      }
      return 1;
    }
    return 0;
    //return double.parse(i.toString()).truncate();
  }

  static double doubles(i) {
    if (isEmpty(i)) return 0.00;
    if (i is double) {
      return i;
    } else {
      return double.parse(i.toString());
    }
  }

  static String string(i) {
    if (isEmpty(i)) return '';
    if (i is String) {
      return i;
    } else {
      return i.toString();
    }
  }

  static List<dynamic> list(i) {
    if (i == null || i == '' || i == 0) {
      return [];
    }
    return i;
  }

  // 字符串截取
  static subString(str, index) {
    return str.substring(0, index);
  }

  static bool isTrue(parpams) {
    if (parpams == null) {
      return false;
    }
    if (parpams == "true" || parpams == true) {
      return true;
    }
    return false;
  }
}