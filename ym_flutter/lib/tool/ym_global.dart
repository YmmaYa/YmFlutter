import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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