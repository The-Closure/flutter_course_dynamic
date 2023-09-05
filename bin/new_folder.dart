
// import 'package:new_folder/new_folder.dart';

import 'package:new_folder/new_folder.dart';

main() {
  int count = 12;
  double price = 13.0;
  String name = "Ahmad";
  bool isCorrect = true;

  print(count);

  var prouctName;

  dynamic age = 12;

  age = "three years";

  const String username = "Abood";
  // username = "Ahmood";

  final String nickname;
  nickname = "Anything";

  List myList = [1, 2, 3, 4];

  Map<String, dynamic> myMap = {"name": "Ahmad", "age": 19};

  print(myMap["age"]);

  Map<String, List<int>> nestMapList = {
    "Ahmad": [20, 30, 59, 59, 59, 60],
    "Khaled": [90, 98, 90, 90, 59, 60]
  };

  print(nestMapList["Khaled"]![4]);

  List<Map<String, int>> nestListMap = [
    {"Ahmad": 59, "Khaled": 90},
    {"Abd": 70, "Rami": 90}
  ];

  print(nestListMap[1].keys.elementAt(1));

  print(addThreeNumber(12, 24, thirdNumber: 30));

  print(calculate());

  print(nestListMap[1]["Rami"]);
}

// ?  normal

// ! optional named param
int addThreeNumber(int firstNumber, int secondNumber, {int thirdNumber = 0}) {
  return firstNumber + secondNumber + thirdNumber;
}

// ! requeired named param
int addThreeNumber1(int firstNumber, int secondNumber,
    {required int thirdNumber}) {
  return firstNumber + secondNumber + thirdNumber;
}
