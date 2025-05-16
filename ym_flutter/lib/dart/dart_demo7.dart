
class DartDemo7{

  static DartDemo7 instance = DartDemo7();



  void dartDemoMain() {
    print('------------------------ 匿名函数 ------------------------');
    print("匿名函数--- greet:${greet('Alice')}");
    print("匿名函数--- greet1:${greet1('贝贝')}");
    test1();

    //4. 立即执行匿名函数:可以定义并立即执行匿名函数!
    () {
      print('匿名函数--- This function runs immediately!__00');
    }();

    (() {
      print('匿名函数--- This function runs immediately!__01');
    })();

    //5. 闭包特性:匿名函数可以访问其词法作用域中的变量
    var add2 = makeAdder(2);
    var add5 = makeAdder(5);
    print("匿名函数---add2(3): ${add2(3)}"); // 输出: 5
    print("匿名函数---add5(3): ${add5(3)}"); // 输出: 8

    //当匿名函数没有参数时，参数列表可以为空或使用下划线 _
    var noParam = () => print('匿名函数--- noParam():No parameters');
    noParam();
    // 如果匿名函数只有一个参数，可以省略参数类型和括号（使用箭头语法时）
    var square = (x) => x * x;
    print("匿名函数--- square(3):${square(3)}");
    print("匿名函数--- square(1.2):${square(1.2)}");

    print('------------------------ 立即执行匿名函数 ------------------------');

    () {
      print('这个匿名函数会立即执行'); // 输出: 这个匿名函数会立即执行
    }();

    (int a, int b) {
      print('a + b = ${a + b}'); // 输出: a + b = 8
    }(3, 5);

    var result = () {
      return '立即执行的结果';
    }();
    print(result); // 输出: 立即执行的结果

    // 创建独立作用域 - 避免变量污染全局作用域
    () {
      var localVar = '局部变量';
      print(localVar);
    }();
    // localVar 在这里不可访问

    // 初始化复杂对象
    var config = () {
      var configMap = {};
      // 复杂的初始化逻辑
      configMap['timeout'] = 1000;
      configMap['retries'] = 3;
      return configMap;
    }();

    // 异步代码的立即执行
    () async {
      var data = await fetchData();
      print(data);
    }();

    // 模块化代码 - 将相关代码组织在一起
    () {
      var users = [];
      void addUser(String name) {
        users.add(name);
      }
      addUser('Alice');
      print(users);
    }();

    var func = () { print('不会立即执行'); };
    func(); // 需要手动调用
  }

  //1. 简单匿名函数
  var greet = (String name) {
    return 'Hello, $name!';
  };

  //2. 箭头语法（单行函数）
  var greet1 = (String name) => 'Hello, $name!';

  //3. 作为参数传递
  void test1(){
    var numbers = [1, 2, 3, 4];
    // 使用匿名函数作为 forEach 的参数
    numbers.forEach((number) {
      print(number * 2);
    });

    // 使用箭头语法简化
    numbers.forEach((number) => print(number * 2));
  }

  Function makeAdder(int addBy) {
    return (int i) => addBy + i; //匿名函数可以访问其词法作用域中的变量 addBy
  }

  Future<int> fetchData() async {
    return 1;
  }

}