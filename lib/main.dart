import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingadmin/routes.dart';
import 'package:parkingadmin/views/screens/login.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: GetRoutes.login,
    getPages: GetRoutes.routes,
  ));
}
