import 'dart:convert';
import 'package:flutter_clear_ach_notification/data/models/notification_model.dart';
import 'package:http/http.dart' as http;

class Datasource {
  final http.Client client;
  Datasource(this.client);

  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await client
          .get(Uri.parse('https://rickandmortyapi.com/api/character'));
      if (response.statusCode == 200) {
        final results = json.decode(response.body)['results'] as List;
        return results.map((json) => NotificationModel.fromJson(json)).toList();
      } else {
        throw Exception('No se pudieron cargar las notificaciones');
      }
    } catch (e) {
      throw Exception('No se pudieron cargar las notificaciones: $e');
    }
  }

  Future<void> deleteNotification(int id) async {
    try {
      final response = await client
          .delete(Uri.parse('https://example.com/notifications/$id'));

      if (response.statusCode != 200) {
        throw Exception('No se pudo eliminar la notificación');
      }
    } catch (e) {
      throw Exception('No se pudo eliminar la notificación: $e');
    }
  }
}
