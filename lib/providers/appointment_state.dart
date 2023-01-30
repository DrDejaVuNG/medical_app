import 'package:flutter/widgets.dart';

class AppointmentState with ChangeNotifier {
  int _appId = 0;
  String _title = 'New appointment';
  String _time = 'Any time';
  String _date = 'Any Day';
  String _status = 'Pending';
  int _intColor = 0xff33691e;

  int get appId => _appId;
  String get title => _title;
  String get time => _time;
  String get date => _date;
  String get status => _status;
  int get intColor => _intColor;

  void onEdit(title, time, date, color, trueTime, trueDate) {
    _title = title;
    if (trueTime != null) {
      _time = time;
    }
    if (trueDate != null) {
      _date = date;
    }

    _intColor = color;

    notifyListeners();
  }

  void onAdd({
    required appId,
    required title,
    required time,
    required date,
    required status,
    required intColor,
  }) {
    _appId = appId;
    _title = title;
    _time = time;
    _date = date;
    _status = status;
    _intColor = intColor;

    notifyListeners();
  }
}
