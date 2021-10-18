import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackbarError(String message) {
    final sackbar = SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 20)),
    );

    messengerKey.currentState!.showSnackBar(sackbar);
  }
}