
import 'package:ym_flutter/tool/ym_global.dart';

class Student {
  String name = '';
  int age = 0;
}

class LiveRoomConfig {
  String? theme;
  int? password;
}

class DartDemo6 with YmGlobal{

  static DartDemo6 instance = DartDemo6();

  int add(int a, int b) => a + b;

  void dartDemoMain() {
    // ------------------------------
    // 箭头函数
    // ------------------------------
    test1();

    // ------------------------------
    // 级联操作符 ..
    // ------------------------------
    test2();

  }

  void test2(){
    print('------------------------ 级联操作符 ------------------------');
    List<int> numbers = [3, 1, 4, 1, 5, 9, 2];
    print('级联操作符：numbers =$numbers}');
    numbers
      ..sort() // 排序
      ..add(6) // 添加元素
      ..remove(1) // 移除第一个匹配的元素
      ..shuffle(); // 随机打乱
    print('级联操作符：numbers =$numbers');
    //级联操作符：numbers =[1, 9, 5, 4, 2, 6, 3]

    List<int> numbers1 = [3, 1, 4, 1, 5, 9, 2];
    print('级联操作符：numbers1 =$numbers1}');
    numbers1
      ..sort() // 排序
      ..add(6) // 添加元素
      ..removeWhere((value)=>value==1) // 移除是1的所有元素
      ..shuffle(); // 随机打乱
    print('级联操作符：numbers1 =$numbers1');
    //级联操作符：numbers1 =[3, 4, 6, 2, 5, 9]

    final student = Student()
      ..name='Alice'
      ..age=25;
    print("级联操作符：student对象的name=${student.name}, age=${student.age}");
    //级联操作符：student对象的name=Alice, age=25

    LiveRoomConfig? liveRoomConfig = null;
    liveRoomConfig
      ?..theme ='dark' //如果 liveRoomConfig 是 null，则不会执行
      ..password = 123456;
    print("级联操作符：LiveRoomConfig对象的theme =${liveRoomConfig?.theme},password=${liveRoomConfig?.password}");
    // 级联操作符：LiveRoomConfig对象的theme =null,password=null

    LiveRoomConfig? liveRoomConfig1 = LiveRoomConfig();
    liveRoomConfig1
      ..theme ='dark'
      ..password = 123456;
    print("级联操作符：LiveRoomConfig对象的theme =${liveRoomConfig1.theme},password=${liveRoomConfig1.password}");
    // 级联操作符：LiveRoomConfig对象的theme =dark,password=123456

    LiveRoomConfig? liveRoomConfig2 = LiveRoomConfig();
    liveRoomConfig2
      ..theme ='dark';
    print("级联操作符：LiveRoomConfig对象的theme =${liveRoomConfig2.theme},password=${liveRoomConfig2.password}");
    // 级联操作符：LiveRoomConfig对象的theme =dark,password=null

  }

  void test1(){
    int a = 10,b=20;

    print('------------------------ 箭头函数 ------------------------');
    //简单用法
    print('箭头函数：a=$a,b=$b, add:${add(a,b)}');

    var numbers = [1, 2, 3, 4, 5];
    print("箭头函数：numbers:$numbers");
    var numbers1 = numbers.map((n) => n * n); // 使用箭头函数作为参数
    print("箭头函数：numbers1:$numbers1"); // 输出: (1, 4, 9, 16, 25)

    List list0 = [{"fromUid":"5","toUid":"3"},{"fromUid":"1","toUid":"2"},{"fromUid":"1","toUid":"3"},{"fromUid":"4","toUid":"2"}];
    print("箭头函数：list0:$list0");

    //把list0中的"fromUid" 和 "toUid" 全部取出放进list
    List list1 = list0
        .expand((element) => [element["fromUid"],element["toUid"]])
        .toList(); // 转回 List
    print("箭头函数：list1:$list1");

    List list2 = list0
        .expand((element) => [element["fromUid"],element["toUid"]])
        .toSet() // 去重
        .toList(); // 转回 List
    print("箭头函数：list2:$list2");

    List list3 = list0
        .expand((element) => [element["fromUid"],element["toUid"]])
        .where((uid) => uid != "2")  // 过滤
        .toSet() // 去重
        .toList(); // 转回 List
    print("箭头函数：list3:$list3");

    List list4 = list0
        .expand((element) => [element["fromUid"],element["toUid"]]) //展开 list0 中的所有 fromUid 和 toUid
        .where((uid) => uid != "2")  // 过滤掉值为 "2" 的项
        .toSet() // 去重
        .toList() // 转回 List
      ..sort(); // 按从小到大排序,使用级联操作符 .. 在转换列表后直接排序
    print("箭头函数：list4:$list4");

    // 用id 来判断两个列表是否相同
    List l1 = [{"id":1},{"id":21},{"id":11},{"id":55}];
    List l2 = [{"id":"21"},{"id":11},{"id":11},{"id":55}];
    print("箭头函数：l1=$l1");
    print("箭头函数：l2=$l2");
    // 提取两个列表的 ID 集合
    Set<int> idS1 = l1.map((item) => Data.ints(item['id'].toString())).toSet();
    Set<int> idS2 = l1.map((item) => Data.ints(item['id'].toString())).toSet();
    print("箭头函数：idS1=$idS1");
    print("箭头函数：idS2=$idS2");
    bool isE = idS1.length == idS2.length && idS1.containsAll(idS2);     // 比较集合是否相同
    print("箭头函数：用id来判断l1和l2是否相同：$isE");
    // 箭头函数：用id来判断l1和l2是否相同：true

    List l3 = [{"id":1},{"id":36},{"id":89},{"id":55}];
    Set<int> idS3 = l3.map((item) => Data.ints(item['id'].toString())).toSet();
    print("箭头函数：idS3=$idS3");
    bool isE1 = idS1.length == idS3.length && idS1.containsAll(idS3);
    print("箭头函数：用id来判断l1和l3是否相同：$isE1");
    // 箭头函数：用id来判断l1和l3是否相同：false
  }
}
