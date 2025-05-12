
class DartDemo1{
  static DartDemo1 instance = DartDemo1();

  void dartDemo1Main(){
    // 基本数据类型是：值传递
    int a = 5;
    modifyValue(a);
    print("a=$a"); // 输出 5（原值未改变）

    //引用类型：引用传递
    var person = Person('Alice');
    modifyObject(person);
    print(person.name); // 输出 "Bob"（原对象被修改）

    var person1 = Person('Alice');
    reassignObject(person1);
    print(person1.name); // 输出 "Alice"（外部引用未改变）

    var numbers = [1, 2, 3];
    addToList(numbers);
    print(numbers); // 输出 [1, 2, 3, 4]（原集合被修改）

    var numbers1 = [0, 1, 2];
    processList(numbers1);
    print(numbers1); // 输出 [0, 1, 2] （原集合未被修改）
  }

  void modifyValue(int x) {
    x = 10; // 修改的是局部副本
  }

  void modifyObject(Person p) {
    p.name = 'Bob'; // 修改的是原对象的内容
  }
  void reassignObject(Person p) {
    p = Person('Charlie'); // 仅修改局部引用的副本
  }

  void addToList(List<int> list) {
    list.add(4); // 修改原集合
    list = [100]; // 仅修改局部引用
  }

  void processList(List<int> list) {
    list = List.from(list); // 创建副本
    list.add(100); // 仅影响副本
  }
}

class Person {
  String name;
  Person(this.name);
}