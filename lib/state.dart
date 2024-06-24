import 'package:flutter/material.dart';

class Todo with ChangeNotifier {
  List<Map<String, dynamic>> symbols2 = [];
  List<Map<String, dynamic>> symbols = [];
  int? selectedIndex;
  int? lastSelectedIndex;

  List<Map<String, dynamic>> fibonacciWithSymbols(int n) {
    List<int> fibSequence = [0, 1];
    symbols = [];

    for (int i = 2; i < n; i++) {
      fibSequence.add(fibSequence[i - 1] + fibSequence[i - 2]);
    }

    for (int i = 0; i < fibSequence.length; i++) {
      int num = fibSequence[i];
      if (num == 0 || num == 1) {
        symbols.add({"index": i, "number": num, "icon": Icons.circle});
      } else if (num % 2 == 0) {
        symbols.add({"index": i, "number": num, "icon": Icons.square_outlined});
      } else {
        symbols.add({"index": i, "number": num, "icon": Icons.clear});
      }
    }

    return symbols;
  }

  void delete(int index) {
    symbols.removeAt(index);
    notifyListeners();
  }

  void addTask(int index, int number, IconData icon) {
    symbols2.add({"index": index, "number": number, "icon": icon});
    notifyListeners();
  }

  void addTask2(int index, int number, IconData icon) {
    symbols.add({"index": index, "number": number, "icon": icon});
    notifyListeners();
  }

  void selectTask(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void updateLastSelectedIndex(int index) {
    lastSelectedIndex = index;
    notifyListeners();
  }
}
