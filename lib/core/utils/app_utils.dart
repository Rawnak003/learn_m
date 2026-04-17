import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  AppUtils._();
  static const String appVersion = '1.0.0';
  static const String contactSupportEmail = "support@example.com";

  static String formattedDate(String? date) {
    if (date == null || date == 'N/A' || date.isEmpty) {
      return 'Date not available';
    }

    try {
      final DateTime parsedDate = DateTime.parse(date).toLocal();
      final DateFormat formatter = DateFormat('MMM dd, yyyy, h:mm a');
      return formatter.format(parsedDate);
    } catch (e) {
      debugPrint('Error parsing date: $date, error: $e');
      return 'Invalid date';
    }
  }

  static void showToast(
      String message, {
        Color? backgroundColor,
        ToastGravity gravity = ToastGravity.BOTTOM,
      }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: backgroundColor ?? Colors.black87,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}