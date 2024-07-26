// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on NotificationSStore, Store {
  late final _$notificationsAtom =
      Atom(name: 'NotificationSStore.notifications', context: context);

  @override
  ObservableList<NotificationModel> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<NotificationModel> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'NotificationSStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$errorMessageDeteleAtom =
      Atom(name: 'NotificationSStore.errorMessageDetele', context: context);

  @override
  String get errorMessageDetele {
    _$errorMessageDeteleAtom.reportRead();
    return super.errorMessageDetele;
  }

  @override
  set errorMessageDetele(String value) {
    _$errorMessageDeteleAtom.reportWrite(value, super.errorMessageDetele, () {
      super.errorMessageDetele = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NotificationSStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$fetchNotificationsAsyncAction =
      AsyncAction('NotificationSStore.fetchNotifications', context: context);

  @override
  Future<void> fetchNotifications() {
    return _$fetchNotificationsAsyncAction
        .run(() => super.fetchNotifications());
  }

  late final _$deleteNotificationAsyncAction =
      AsyncAction('NotificationSStore.deleteNotification', context: context);

  @override
  Future<void> deleteNotification(int id) {
    return _$deleteNotificationAsyncAction
        .run(() => super.deleteNotification(id));
  }

  late final _$NotificationSStoreActionController =
      ActionController(name: 'NotificationSStore', context: context);

  @override
  void clearError() {
    final _$actionInfo = _$NotificationSStoreActionController.startAction(
        name: 'NotificationSStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$NotificationSStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
errorMessage: ${errorMessage},
errorMessageDetele: ${errorMessageDetele},
isLoading: ${isLoading}
    ''';
  }
}
