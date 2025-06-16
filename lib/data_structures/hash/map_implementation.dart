Map<int, int> countOccur(List<int> mylist) {
  Map<int, int> newMap = {};
  for (var element in mylist) {
    if (newMap.containsKey(element)) {
      newMap[element] = newMap[element]! + 1;
    } else {
      newMap[element] = 1;
    }
  }
  return newMap;
}

Map<dynamic, dynamic> filterMap(Map<dynamic, dynamic> inputMap, int Threshold) {
  Map<dynamic, dynamic> newMap = {};
  inputMap.forEach(
    (key, value) {
      if (value > Threshold) {
        newMap[key] = value;
      }
    },
  );
  return newMap;
}

Map<dynamic, dynamic> mergeMaps(
    Map<dynamic, dynamic> mapOne, Map<dynamic, dynamic> mapTwo) {
  Map<dynamic, dynamic> newMap = Map.from(mapOne);

  mapTwo.forEach((key, value) {
    if (newMap.containsKey(key)) {
      newMap[key] = newMap[key]! + value;
    } else {
      newMap[key] = value;
    }
  });

  return newMap;
}

Map<dynamic, dynamic> invertMap(Map<dynamic, dynamic> myMap) {
  Map<dynamic, dynamic> newMap = {};

  for (var key in myMap.keys) {
    var newvalue = myMap[key];
    newMap[newvalue] = key;
  }

  return newMap;
}

String findMaxKey(Map<dynamic, dynamic> myMap) {
  String maxKey = '';
  int maxValue = 0;

  for (var key in myMap.keys) {
    int value = myMap[key]!;

    if (value > maxValue) {
      maxValue = value;
      maxKey = key;
    }
  }

  return maxKey;
}

List<dynamic> sortKeysByValues(Map<dynamic, dynamic> inputMap) {
  List<dynamic> keys = [];
  for (var key in inputMap.keys) {
    keys.add(key);
  }

  for (int i = 0; i < keys.length - 1; i++) {
    for (int j = 0; j < keys.length - i - 1; j++) {
      if (inputMap[keys[j]] > inputMap[keys[j + 1]]) {
        var temp = keys[j];
        keys[j] = keys[j + 1];
        keys[j + 1] = temp;
      }
    }
  }

  return keys;
}

Map<String, List<String>> groupByFirstCharacter(List<String> inputList) {
  Map<String, List<String>> groupedMap = {};

  for (int i = 0; i < inputList.length; i++) {
    String item = inputList[i];
    String firstChar = item[0];

    if (!groupedMap.containsKey(firstChar)) {
      groupedMap[firstChar] = [];
    }

    groupedMap[firstChar]!.add(item);
  }

  return groupedMap;
}

void main() {
  //   List<int> input = [1, 2, 2, 3, 3, 3];
  // Map<int, int> result = countOccur(input);
  // print(result);

  // Map<dynamic, dynamic> inputMap = {'Alice': 80, 'Bob': 45, 'Charlie': 70};
  // int Threshold = 50;
  // print(filterMap(inputMap, Threshold));

  // Map<dynamic, dynamic> mapOne = {'a': 1, 'b': 2};
  // Map<dynamic, dynamic> mapTow = {'b': 3, 'c': 4};
  // print(mergeMaps(mapOne, mapTow));

  // Map<dynamic, dynamic> myMap = {'apple': 1, 'banana': 2, 'cherry': 3};
  // print(invertMap(myMap));

  // Map<dynamic, dynamic> myMap = {'x': 10, 'y': 50, 'z': 20};
  // print(findMaxKey(myMap));

  // Map<dynamic, dynamic> inputMap = {'a': 3, 'b': 1, 'c': 2};
  // List<dynamic> result = sortKeysByValues(inputMap);
  // print(result);
  //  List<String> inputList = ['apple', 'apricot', 'banana', 'blueberry', 'cherry'];
  // Map<String, List<String>> result = groupByFirstCharacter(inputList);
  // print(result);
}
