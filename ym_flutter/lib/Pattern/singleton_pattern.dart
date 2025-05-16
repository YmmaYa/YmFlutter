
class Singleton {
  // 私有静态实例
  static final Singleton _instance = Singleton._internal();
  // 工厂构造函数
  factory Singleton() => _instance;
  // 私有构造函数
  Singleton._internal();
  // 其他方法
  void doSomething() {
    print("Doing something...");
  }
}



