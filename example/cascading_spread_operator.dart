// Simple Color class for demonstration purposes
class Color {
  final String name;
  Color(this.name);

  @override
  String toString() => name;
}

class Person {
  String? name;
  int? age;
  Color? color; // Nullable property to demonstrate the use of null safety
  List<String> hobbies = []; // List to hold hobbies
  List<String> names = [];
  Person({
    this.name,
    this.age,
    this.color,
  }); // Constructor with optional parameters

  void display() {
    print(
      'Name: $name, Age: $age, Color: ${color?.toString() ?? 'None'}',
    ); // This method displays the properties of the Person object
    // If color is null, it displays 'None'
  }

  Person copyWith({String? name, int? age, Color? color}) {
    // This method allows you to create a copy of the Person object with modified properties
    // If a property is not provided, it retains the original value
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
      color: color ?? this.color,
    );
  }
}

void main() {
  var person1 = // Creating a Person object using the constructor
      Person()
        ..name =
            "Mohammad Hmedat" // Using the cascade operator to set properties
        ..age = 21
        ..color = Color("white")
        ..hobbies.addAll([
          'Reading',
          'Coding',
          'Gaming',
        ]) // Adding hobbies to the list
        ..names.addAll(['Alice', 'Bob', 'Charlie']);

  List<String> hobbies_names = [
    ...person1.hobbies, // Using the spread operator to add hobbies to the list
    ...person1.names, // Using the spread operator to add names to the list
  ];
}
