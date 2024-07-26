import 'package:flutter_clear_ach_notification/data/models/notification_model.dart';
import '../repositories/notification_repository.dart';

class Notifications {
  final NotificationRepository repository;

  Notifications({required this.repository});

  Future<List<NotificationModel>> getNotifications() {
    return repository.getNotifications();
  }

  Future<void> deleteNotification(int id) {
    return repository.deleteNotification(id);
  }
}
