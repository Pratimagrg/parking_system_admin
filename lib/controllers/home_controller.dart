import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:parkingadmin/models/user.dart';
import 'package:parkingadmin/utils/baseUrl.dart';
import 'package:parkingadmin/utils/shared_prefs.dart';
import 'package:parkingadmin/views/components/custom_snackbar.dart';

class HomeController extends GetxController {
  var categoryNameController = "".obs;
  var costController = "".obs;
  var slotController = "".obs;
  var categoryId = "".obs;
  // TextEditingController slotsController = TextEditingController();
  var isLoading = true.obs;

  List categories = RxList.empty(growable: true);
  var selectedCategory = "".obs;
  String nameError = "";
  String costError = "";
  String slotsError = "";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchCategory();
  }

  updateAllFields(category) {
    categoryNameController.value = category["category"];
    costController.value = category["cost_per_hour"];
    slotController.value = category["slots"];
    categoryId.value = category["id"];
    update();
  }

  fetchCategory() async {
    var url = Uri.parse(baseUrl + 'categories.php');
    var response = await http.get(url);
    var res = json.decode(response.body);
    if (res['success']) {
      //addd response list to categoires
      categories.addAll(res["message"]);

      Get.snackbar(
        'Success',
        'Categories Sucessfully Fetched',
        snackPosition: SnackPosition.TOP,
      );
    } else {
      print("error");
      customSnackbar('failed to fetch', 'Something went wrong', 'error');
    }
    isLoading.value = false;
    // print("values" + categories.toString());
    update();
  }

  updateCategory() async {
    var user = await SharedPrefs().getUser();
    var decodeUser = json.decode(user);

    var url = Uri.parse(baseUrl + 'update_category.php');
    var response = await http.post(url, body: {
      "id": categoryId.value,
      "name": categoryNameController.value,
      "slots": slotController.value,
      "cost_per_hour": costController.value,
      "user_id": decodeUser["id"],
    });
    var res = json.decode(response.body);
    if (res['success']) {
      customSnackbar('Success', 'Category Updated', 'success');
      categories.clear();
      fetchCategory();
    } else {
      customSnackbar('failed to update', 'Something went wrong', 'error');
    }
  }
}
