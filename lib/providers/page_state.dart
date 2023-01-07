import 'package:flutter/widgets.dart';

class PageState with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void setCurrentIndex(int index) {
    _index = index;
    notifyListeners();
  }

  schedule() {
    _index = 1;
    notifyListeners();
  }
}
