import 'appointment_db.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/backend/get_appointments.dart';
import 'package:medical_app/models/notification_model.dart';

DateTime date = DateTime.now();
DateTime time = DateTime.now();
final trueTime = DateFormat('jm').format(time);
final trueDate = DateFormat('MMMM d').format(date);

List notifications = [];
List exNotifications = [];

void storeNotifications() {
  box.put('NOTIFICATIONS', notifications);
}

void getNotifications() {
  if (box.get('NOTIFICATIONS') != null) {
    notifications = box.get('NOTIFICATIONS');
  }
}

void createNotification({
  id,
  required title,
  required time,
  required date,
  required description,
}) {
  NotificationModel notification = NotificationModel(
    id: id,
    title: title,
    time: time,
    date: date,
    description: description,
  );
  if (box.get('NOTIFICATIONS') != null) {
    exNotifications = box.get('NOTIFICATIONS');
    for (var existing in exNotifications) {
      if (existing.id != notification.id) {
        notifications.add(notification);
        storeNotifications();
      }
    }
  } else {
    notifications.add(notification);
    storeNotifications();
  }
}

void appNotification() {
  for (var appointment in appointmentData) {
    var status = appointment.status;
    if (status != 'Pending') {
      createNotification(
        id: appointment.appId,
        title: 'Appointment Details',
        time: trueTime,
        date: trueDate,
        description: 'Your appointment has been $status',
      );
    }
  }
}

void medNotification() {
  for (var pill in pillList) {
    if (pill.time != trueTime) {
      var title = pill.title;
      createNotification(
        title: 'Medication Reminder',
        time: trueTime,
        date: trueDate,
        description: "It's time to take your $title medication",
      );
    }
  }
}
