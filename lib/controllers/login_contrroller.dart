import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:parkingadmin/models/user.dart';
import 'package:parkingadmin/routes.dart';
import 'package:parkingadmin/utils/baseUrl.dart';
import 'package:parkingadmin/utils/shared_prefs.dart';
import 'package:parkingadmin/views/components/custom_snackbar.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameError = "";
  String passwordError = "";
  bool isLoading = false;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    var user = await SharedPrefs().getUser();

    if (user != null) {
      Get.offAllNamed(GetRoutes.home);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    // usernameController.dispose();
    // passwordController.dispose();
  }

  checkLogin() {
    usernameError = "";
    passwordError = "";
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty) {
      usernameError = "* Username required";
    }
    if (password.isEmpty) {
      passwordError = "* Password required";
    }
    update();

    if (username.isNotEmpty && password.isNotEmpty) {
      attemptLogin();
    }
  }

  attemptLogin() async {
    isLoading = true;
    update();
    var url = Uri.parse(baseUrl + 'login.php');
    var response = await http.post(url, body: {
      'username': usernameController.text,
      'password': passwordController.text,
    });
    var res = json.decode(response.body);
    if (res['success']) {
      User user = User.fromJson(res['data'][0]);
      await SharedPrefs().storeUser(json.encode(user));
      Get.offAllNamed(GetRoutes.home);
    } else {
      customSnackbar('Login Failed', res['message'][0], 'error');
    }
  }
}
