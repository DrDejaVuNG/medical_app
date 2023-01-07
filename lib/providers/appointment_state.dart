import 'package:flutter/widgets.dart';
import 'package:medical_app/config/constants.dart';

class AppointmentState with ChangeNotifier {
  String _title = 'Medicine Prescription';
  String _time = '09:00';
  String _date = 'December 12, 2022';
  Color _color = kPrimaryColor;
  int _added = 0;

  String get title => _title;
  String get time => _time;
  String get date => _date;
  Color get color => _color;
  int get added => _added;

  void isAdded() {
    _added++;
    notifyListeners();
  }

  void onEdit(title, time, date, color, trueTime, trueDate) {
    _title = title;
    if (trueTime != null) {
      _time = time;
    }
    if (trueDate != null) {
      _date = date;
    }

    _color = color;

    notifyListeners();
  }

  void onAdd(title, time, date, color) {
    _title = title;
    _time = time;
    _date = date;
    _color = color;

    notifyListeners();
  }
}
