import 'package:flutter/widgets.dart';

class InputState with ChangeNotifier {
  String _email = '';
  String _name = '';
  String _mobile = '';
  String _password = '';

  String get email => _email;
  String get name => _name;
  String get mobile => _mobile;
  String get password => _password;

  void setValue(String value, String type) {
    if (type == 'email') {
    _email = value;
    }
    if (type == 'name') {
    _name = value;
    }
    if (type == 'mobile') {
    _mobile = value;
    }
    if (type == 'password') {
    _password = value;
    }
    notifyListeners();
  }
}
