import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/notification_store.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationStore = Provider.of<NotificationStore>(context);
    bool delete = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              notificationStore.fetchNotifications();
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (notificationStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (notificationStore.notifications.isEmpty) {
            return const Center(
              child: Text('No notifications available'),
            );
          }

          if (notificationStore.errorMessage.isNotEmpty) {
            return Center(
              child: Text(notificationStore.errorMessage),
            );
          }

          if (notificationStore.errorMessageDetele.isNotEmpty) {
            delete = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(notificationStore.errorMessageDetele),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 2),
                ),
              );
              notificationStore.clearError();
            });
          }

          return ListView.builder(
            itemCount: notificationStore.notifications.length,
            itemBuilder: (context, index) {
              var notification = notificationStore.notifications[index];
              return Dismissible(
                key: Key(notification.id.toString()),
                confirmDismiss: (direction) async {
                  await notificationStore.deleteNotification(notification.id);
                  if (delete) {
                    notificationStore.notifications.removeAt(index);
                    return true;
                  } else {
                    return false;
                  }
                },
                child: ListTile(
                  title: Text(notification.name),
                  subtitle:
                      Text('${notification.name} - ${notification.species}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
