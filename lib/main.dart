import 'package:flutter/material.dart';
import 'package:flutter_clear_ach_notification/data/datasource/datasource.dart';
import 'package:flutter_clear_ach_notification/domain/usecases/notifications.dart';
import 'package:provider/provider.dart';
import 'presentation/stores/notification_store.dart';
import 'data/repositories/notification_repository_impl.dart';
import 'presentation/pages/notification_list.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationStore>(
            create: (_) => NotificationStore(
                notification: Notifications(
                    repository: NotificationRepositoryImpl(
                        datasource: Datasource(http.Client()))))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotificationList(),
    );
  }
}
