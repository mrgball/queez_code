import 'package:flutter/material.dart';

late GlobalKey<NavigatorState> gNavigatorKey;

// HELPER FUNCTION
String convertToAbjad(String value) => value.replaceAll('answer_', '');
