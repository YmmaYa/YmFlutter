
import 'package:get/get.dart';

class YmGetxMineInfoController extends GetxController {
  YmUserInfoModel mineInfo = YmUserInfoModel(
    id: "777",
    avar: "assets/images/02.jpeg",
    name: "小希",
    age: 21,
    gender: 1,
  );

  //用户金币
  var coin = 999.obs; // RxInt

  // 更新用户信息
  void updateUserInfo(Map<String,dynamic> jsonInfo) {
    mineInfo = YmUserInfoModel.fromJson(jsonInfo);
    update();
  }

  //方法1: 重新赋值整个对象（推荐）
  // 更新用户姓名
  void updateUserName(String newName){
    mineInfo = YmUserInfoModel(
      id: mineInfo.id,
      avar: mineInfo.avar,
      name: newName, // 更新名字
      age: mineInfo.age,
      gender: mineInfo.gender,
    );
    update(); // 通知 GetBuilder 刷新
  }

  //方法2：使用 copyWith 方法
  //修改年龄
  void updateUserAge(int newAge){
    mineInfo = mineInfo.copyWith(age: newAge);
    update();
  }

  // 模拟从网络加载数据
  Future<void> fetchUserInfo() async {
    await Future.delayed(Duration(seconds: 1)); // 模拟网络请求
  }
}

//基础数据模型
class YmUserInfoModel {
   String id;
    String avar;
   String name;
    int age;
    int gender;

  YmUserInfoModel({
    required this.id,
    required this.avar,
    required this.name,
    required this.age,
    required this.gender,
  });

  factory YmUserInfoModel.fromJson(Map<String, dynamic> json) {
    return YmUserInfoModel(
      id: json['id'] as String,
      avar: json['avar'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'avar': avar,
    'name': name,
    'age': age,
    'gender': gender,
  };

  YmUserInfoModel copyWith({
    String? id,
    String? avar,
    String? name,
    int? age,
    int? gender,
  }) {
    return YmUserInfoModel(
      id: id ?? this.id,
      avar: avar ?? this.avar,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}