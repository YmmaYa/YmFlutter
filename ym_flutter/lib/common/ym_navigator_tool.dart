
import 'package:flutter/cupertino.dart';

class NavigatorTool{
  var name = "Flutter";
}

class A {
  late final B b;
}

class B {
  final A a;
  B(this.a);
}

/** Note5: 变量与常量的声明与使用
一、变量声明‌
  1、基础语法‌
    （1）var 关键字‌：自动推断变量类型，赋值后类型锁定，不可修改。
            var name = "Flutter"; // 类型推断为 String
    （2）‌显式类型声明‌：直接指定变量类型（如 String、int）‌。
            String framework = "Flutter";
            int version = 3;
    （3）dynamic 与 Object‌：允许变量类型动态变化，但 dynamic 更灵活，Object 为所有类型的基类‌。
            dynamic data = "Text";
            data = 100; // 合法操作
  2、‌空安全机制‌
    ‌（1）非空变量必须初始化‌：未初始化的非空变量会触发编译错误（如 String name; 非法）‌。
    ‌（2）可空类型‌：使用 ? 声明变量允许为 null。
            String? nullableName; // 初始化为 null
‌二、常量声明‌
     1、final
     2、const
三、变量与常量的对比‌
      特性‌	      ｜变量 (var/dynamic)	       ｜final	                      ｜const
      可变性‌	    ｜可修改值和类型 (dynamic)    ｜引用不可变，内容可修改（集合类）‌  ｜引用和内容均不可变‌
      初始化时机‌	｜运行时	                    ｜运行时	                      ｜编译时
      典型场景‌	  ｜动态数据、临时计算	          ｜对象属性、运行时动态值	        ｜全局配置、性能优化‌
‌四、最佳实践‌
    1、‌优先使用 final‌：若变量无需修改，声明为 final 以提高代码可读性和安全性‌。
    2、性能优化‌：在 Flutter 中，const 修饰的 Widget 可避免重复构建（如 const Text("Hello")）‌。
    3、避免滥用 dynamic‌：仅在需要动态类型时使用，优先用 Object 或显式类型‌。
五、总结‌
    1、‌变量‌：通过 var、显式类型或 dynamic 声明，支持空安全与动态类型‌。
    2、‌常量‌：
        （1）final：运行时初始化，适用于对象属性和动态值‌。
        （2）const：编译时固定值，用于全局常量和性能优化‌。
    3、合理选择声明方式，可提升代码健壮性和执行效率。

 */

//——————————————————————————————————————————————————————————————————————————————
/** Note4: late 关键字
一、核心特性
  1、延迟初始化：late 允许声明非空变量时‌暂不初始化‌，但必须在首次访问前完成赋值，否则抛出 LateInitializationError 异常‌。
          late String username;
          void init() {
              username = "Flutter"; // 延迟赋值
          }
  2、‌空安全兼容性‌；结合 Dart 空安全机制，late 变量默认为非空类型，无需添加 ? 符号，但需开发者确保使用前初始化‌。
  3、支持懒加载‌：结合 final 使用，可在首次访问时执行初始化逻辑（如复杂计算或异步加载）‌。
          late final String config = _loadConfig(); // 首次访问时执行
‌二、典型使用场景‌
  1、‌依赖异步数据初始化‌：变量需通过异步操作（如网络请求）获取值时，可用 late 延迟赋值‌。
          late List<int> data;
          Future<void> fetchData() async {
            data = await http.get(...);
          }
  2、解决对象循环依赖‌：对象间存在相互引用时，通过 late 避免初始化顺序冲突‌。
          class A {
              late final B b;
          }
          class B {
              final A a;
              B(this.a);
          }
  3、优化性能‌：对耗时资源（如配置文件解析）使用懒加载，减少不必要的初始化开销‌。
三、注意事项与常见错误‌
  1、初始化风险‌：若未正确初始化直接访问 late 变量，会触发运行时异常 LateInitializationError‌。
        late int count;
        void main() => print(count); // 抛出异常
  2、与 Flutter 生命周期结合‌：在 initState 中初始化 late 变量时，需确保异步操作完成后再调用 setState 更新 UI‌。
        late String data;
        @override
        void initState() {
            super.initState();
            fetchData().then((value) => setState(() => data = value));
        }
  3、‌避免滥用‌：仅在明确初始化逻辑的场景使用 late，过度使用会增加代码维护难度和运行时风险‌。
四、与其他关键字的对比‌
    ‌关键字‌	｜‌初始化时机‌	  ｜可变性‌	｜‌典型场景‌
    late	｜运行时延迟赋值	｜可多次赋值（非 final）	｜异步数据、循环依赖、懒加载‌
    final	｜运行时单次赋值	｜不可变	｜不可变对象、运行时计算值‌
    const	｜编译时固定值	｜不可变	｜全局常量、性能优化‌
五、总结‌
    1、late 通过延迟初始化和懒加载机制，解决了空安全下非空变量的初始化灵活性需求，适用于异步操作、对象依赖和性能优化场景‌。
    2、需严格确保变量在使用前初始化，避免运行时异常，并谨慎选择与其他关键字（如 final/const）的搭配‌。
 */

//——————————————————————————————————————————————————————————————————————————————
/** Note3: const关键字
 一、核心定义与特性
    1、编译时常量：const 用于声明‌编译时确定的常量‌，值必须在代码编译阶段已知且不可变，适用于变量、构造函数等场景‌。
          const String apiKey = "12345";
          const List<int> numbers = [1, 2, 3];
    2、不可变性‌：const 变量和对象‌引用与内容均不可修改‌（包括集合元素），而 final 仅限制引用不可变。
二、使用场景‌
    1、常量构造函数‌：若类构造函数被 const 修饰，所有成员变量必须为 final，且实例可复用以减少内存开销‌。
          class ConstWidget {
            final String name;
            const ConstWidget(this.name);
          }
          // 使用
          const widget = ConstWidget("Flutter");
    2、优化 Flutter 性能‌：在 Flutter 中，使用 const 修饰 Widget 可避免重复构建，提升渲染性能（如 const Text("Hello")。
    3、‌不可变集合‌：const 修饰的集合（如 List、Map）‌元素不可修改‌，需在编译时初始化‌。
        const list = [1, 2, 3];
        list.add(4);  // 非法操作
三、与 final 的对比
    特性‌	      ｜const	              ｜final
    ‌初始化时机‌	｜编译时（必须立即赋值）‌  ｜运行时（允许延迟初始化）‌
    ‌可变性‌	    ｜引用和内容均不可变‌     ｜引用不可变，内容可修改（集合类）‌
    ‌适用场景‌	  ｜全局常量、编译时固定值‌	｜实例变量、运行时动态值‌
四、注意事项‌
    1、编译时赋值限制‌：const 变量必须使用编译时可确定的值（如字面量、其他 const 变量），无法使用运行时数据（如 DateTime.now()）‌。
    2、类成员限制‌：若类包含 const 构造函数，所有实例变量必须声明为 final。
    3、性能优势‌：const 对象在内存中仅保留一份副本，适用于频繁创建的 Widget 或对象，减少 GC 压力‌。
五、总结
    1、const 是 ‌编译时深度不可变‌ 的常量声明，适用于全局配置、性能优化及不可变集合‌。
    2、与 final 相比，const 更严格但性能更优，尤其在 Flutter 的 Widget 构建中推荐使用‌。
    3、需注意其编译时初始化限制及与 final 的适用场景差异，合理选择关键字以提升代码质量‌。
 */

//——————————————————————————————————————————————————————————————————————————————
/** Note2: final 关键字
 一、核心定义与特性
    1、不可变性：final 声明变量后，其值‌仅允许赋值一次‌，且不可修改，适用于变量、方法参数等场景‌。
        final String name = "Flutter";
        final List<int> numbers = [1, 2, 3];
    2、初始化时机‌：final 变量可在‌运行时初始化‌（如通过构造函数传参），而无需在编译时确定‌。
        class User {
            final String id;
            User(this.id); // 运行时初始化
        }
二、使用场景‌
    1、实例变量声明‌：final 常用于修饰类的成员变量，确保对象创建后属性不可变‌。
        class Circle {
            final double radius;
            Circle(this.radius);
        }
    2、不可变集合：final 修饰的集合变量（如 List、Map）‌引用不可变，但内容可变‌（除非使用 const 修饰集合）。
        final list = [1, 2, 3];
        list.add(4);    // 合法操作
        list = [5, 6];  // 非法操作（引用不可变）
    3、传递不可变参数‌：方法参数声明为 final 可避免意外修改，增强代码安全性‌。
        void printMessage(final String msg) {
          // msg = "New";  // 非法操作
          print(msg);
        }
三、与 const 的对比‌
    ‌特性‌	       ｜final	                      ｜const
    ‌初始化时机‌	 ｜运行时（允许延迟初始化）‌         ｜编译时（必须立即初始化）‌
    ‌可变性‌	     ｜引用不可变，内容可修改（集合类）‌	  ｜引用和内容均不可变‌
    ‌适用场景‌	   ｜实例变量、方法参数、运行时动态值‌	  ｜全局常量、编译时固定值（如数学常量）‌

四、注意事项
    1、不可修饰类或方法‌：final ‌不能用于修饰类或方法‌（与 Java 不同），仅作用于变量和参数‌。
    2、与 late 结合使用‌：延迟初始化非空变量时，可通过 late final 声明，但需确保后续仅赋值一次‌。
        late final String data;
        void initData() {
            data = "Loaded";
        }
    3、性能优化‌：final 变量在运行时确定，适用于动态计算场景；const 在编译时优化，适合固定值‌。
五、总结：
    1、final 提供‌运行时不可变性‌，适用于实例变量、方法参数等需动态赋值的场景‌。
    2、与 const 相比，final 更灵活，允许延迟初始化及集合内容修改。
    3、合理使用 final 可提升代码可读性和安全性，减少意外修改风险‌。
 */

//——————————————————————————————————————————————————————————————————————————————
/** Note1:  static 关键字
 一、核心定义与特性
    1、类变量声明：static 用于声明‌类级别的变量或方法‌，使其属于类本身而非实例对象，可通过类名直接访问‌。
        class Page {
          static int currentPage = 1;  // 类变量
          static void scrollDown() {   // 类方法
            currentPage = 1;
          }
        }
    2、内存分配特性‌：静态变量在‌程序启动时即初始化‌，且仅在内存中保留一份副本，所有实例共享该变量‌。
二、使用场景与限制‌
    1、适用场景‌：
      （1）‌共享数据管理‌：如全局计数器、配置参数等需跨实例共享的数据‌。
      ‌（2）工具方法‌：无需依赖实例状态的工具函数（如数学计算、格式转换等）。
    2、‌访问限制‌
      ‌（1）静态方法‌：
                只能访问静态变量或调用其他静态方法‌。
                不可访问实例变量或非静态方法（因无实例上下文）。
      （2）‌实例方法‌：可自由访问静态变量和调用静态方法‌。
    3、Flutter 中的注意事项‌
    ‌（1）避免在小部件中滥用静态变量‌：
                静态变量生命周期与应用程序一致，可能导致内存泄漏（如持有BuildContext或大对象）‌。
    （2）‌状态管理替代方案‌：
                如需跨组件共享状态，优先使用 Provider、Riverpod 等状态管理工具，而非依赖静态变量‌。
三、与其他关键字的对比
    关键字	 ｜作用域	    ｜赋值规则	        ｜适用场景

    static ｜类级别	    ｜可多次修改	      ｜共享数据、工具方法‌
    final	 ｜实例或类级别	｜运行时赋值，仅一次	｜不可变实例变量‌
    const	 ｜编译时常量	  ｜编译时赋值，不可变	｜固定值集合、不可变对象‌
四、代码示例与常见错误‌
    1、正确用法：
          class AppConfig {
            static const String apiUrl = "https://api.example.com";
            static int requestCount = 0;
          }
    2、错误示例‌
          class Page {
              int currentPage = 1;
              static void scrollDown() {
                  currentPage = 1;  // 错误：静态方法访问实例变量‌:ml-citation{ref="5,7" data="citationList"}
              }
          }
五、总结‌
  （1）static 用于声明类级别的共享变量或工具方法，适用于‌全局数据管理‌和‌无状态工具函数‌‌。
  （2）需注意‌生命周期管理‌，避免在 Flutter 小部件中滥用静态变量导致内存问题‌。
  （3）结合 final 或 const 可进一步控制变量的可变性与初始化时机‌。

 */