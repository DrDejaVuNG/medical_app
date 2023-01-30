import 'package:flutter/widgets.dart';

class RefreshState with ChangeNotifier {
  int _read = 0;

  int get read => _read;

  void refresh() {
    _read++;
    notifyListeners();
  }
}
