import 'dart:async';
import 'package:flutter_clear_ach_notification/data/datasource/datasource.dart';
import 'package:flutter_clear_ach_notification/data/models/notification_model.dart';

import '../../domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final Datasource _datasource;

  NotificationRepositoryImpl({required Datasource datasource})
      : _datasource = datasource;
  @override
  Future<void> deleteNotification(int id) async {
    return await _datasource.deleteNotification(id);
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    return _datasource.getNotifications();
  }
}
