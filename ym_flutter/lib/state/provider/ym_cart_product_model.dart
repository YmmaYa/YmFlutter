
import 'package:get_storage/get_storage.dart';

///
/// 在 Flutter 开发中，数据模型(Model)是应用程序架构的核心部分，负责管理业务数据和逻辑。
///
/// 以下是 Flutter 中数据模型的完整实践方案：
///
/// 一、基础数据模型
///  1. 纯 Dart 模型类
///
///  二、状态管理集成模型
///  1. 与 Provider 集成
///  2. 与 Riverpod 集成
///
///  三、高级数据模型技术
///  1. 使用 Freezed 生成不可变模型
///  2. 使用 Equatable 实现值相等
///
/// 四、数据模型最佳实践
/// 1.分层架构：
///   领域层：纯业务逻辑和核心模型
///   应用层：与框架集成的模型（如ChangeNotifier）
///   基础设施层：与API/数据库交互的模型
/// 2.验证逻辑：
/// 3.领域驱动设计(DDD)：
///
/// 五、常见数据模型模式
/// 1. 单例服务模型
/// 2. 数据仓库模式
///
/// 六、性能优化技巧
/// 1.使用 const 构造函数：
/// 2.延迟加载：
/// 3.分页模型：
/// 过合理设计数据模型，可以显著提高Flutter应用的可维护性和性能。
/// 根据项目复杂度选择适合的模型实现方式，小型项目可以使用简单模型，大型项目建议采用更结构化的方案如Freezed+DDD。


//基础数据模型
class YmCartProductModel {
  final String id;
  final String imgPath;
  final String name;
  final double price;
  final int count;
  int addCount;

  YmCartProductModel({
    required this.id,
    required this.imgPath,
    required this.name,
    required this.price,
    required this.count,
    this.addCount =0,
  });

  // 从JSON创建模型
  factory YmCartProductModel.fromJson(Map<String, dynamic> json) {
    return YmCartProductModel(
      id: json['id'],
      imgPath:json['imgPath'],
      name: json['name'],
      price: json['price'],
      count: json['count'],
      addCount:json['addCount'],
    );
  }

  // 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imgPath':imgPath,
      'name': name,
      'price':price,
      'count': count,
      'addCount':addCount,
    };
  }

  // 拷贝方法
  YmCartProductModel copyWith({
    String? id,
    String?imgPath,
    String? name,
    double?price,
    int? count,
    int?addCount,
  }) {
    return YmCartProductModel(
      id: id ?? this.id,
      imgPath:imgPath??this.imgPath,
      name: name ?? this.name,
      price:price?? this.price,
      count: count ?? this.count,
      addCount:addCount?? this.addCount,
    );
  }
}