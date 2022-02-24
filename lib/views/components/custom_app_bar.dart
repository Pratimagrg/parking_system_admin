import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    backgroundColor: const Color(0xff154C79),
    foregroundColor: Colors.white,
    title: const Text(
      'Parking System',
      style: TextStyle(fontSize: 20),
    ),
  );
}
