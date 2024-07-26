import 'package:flutter_clear_ach_notification/data/models/notification_model.dart';
import 'package:flutter_clear_ach_notification/domain/usecases/notifications.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

part 'notification_store.g.dart';

class NotificationStore = NotificationSStore with _$NotificationStore;

abstract class NotificationSStore with Store {
  final Notifications notification;

  NotificationSStore({required this.notification}) {
    fetchNotifications();
  }

  @observable
  ObservableList<NotificationModel> notifications =
      ObservableList<NotificationModel>();

  @observable
  String errorMessage = '';

  @observable
  String errorMessageDetele = '';

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchNotifications() async {
    isLoading = true;
    try {
      final fetchedNotifications = await notification.getNotifications();
      notifications = ObservableList.of(fetchedNotifications);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> deleteNotification(int id) async {
    try {
      await notification.deleteNotification(id);
      notifications.removeWhere((notification) => notification.id == id);
    } catch (e) {
      errorMessageDetele = e.toString();
    }
  }

  @action
  void clearError() {
    errorMessage = '';
    errorMessageDetele = '';
  }
}
