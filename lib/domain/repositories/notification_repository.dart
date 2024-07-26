import 'package:flutter_clear_ach_notification/data/models/notification_model.dart';

abstract interface class NotificationRepository {
  Future<List<NotificationModel>> getNotifications();
  Future<void> deleteNotification(int id);
}
