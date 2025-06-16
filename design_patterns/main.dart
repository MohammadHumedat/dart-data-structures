class Singleton {
  static Singleton? _instance; // create an private instance of singleton class.

  Singleton._singleton_constructor() {
    // create a private constructor
    print('test the singleton');
  }

  // create public static method to get the singleton instance
  static Singleton getInstance() {
    if (_instance == null) {
      _instance = Singleton._singleton_constructor(); //lazy initialization
    }
    return _instance!;
  }

  @override
  String toString() {
    print('final test');
    return super.toString();
  }
}

void main() {
  var s1 = Singleton._singleton_constructor();
  var objectOne = Singleton.getInstance();
  print(objectOne);
  print('----------- spacer-----------');
  print(s1);
}
