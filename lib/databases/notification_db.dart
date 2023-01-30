import 'user_db.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/databases/medication_db.dart';
import 'package:medical_app/models/appointment_model.dart';
import 'package:medical_app/models/notification_model.dart';
import 'package:medical_app/components/local_notification.dart';

final trueTime = DateFormat('jm').format(DateTime.now());
final trueDate = DateFormat('MMMM d').format(DateTime.now());

List notificationList = [];
List exNotifications = [];

void storeNotifications() {
  box.put('NOTIFICATIONS', notificationList);
}

void getNotifications() {
  if (box.get('NOTIFICATIONS') != null) {
    notificationList = box.get('NOTIFICATIONS');
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
  notificationList.add(notification);
  storeNotifications();
  showNotification(
    id: id,
    title: title,
    description: description,
  );
}

// Appointment Notification
void appNotification(AppointmentModel appointment) {
  var status = appointment.status;
  createNotification(
    id: appointment.appId,
    title: 'Appointment Details',
    time: trueTime,
    date: trueDate,
    description: 'Your appointment has been $status',
  );
}

// Medication Notification
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
