import 'dart:convert';

import 'package:get/get.dart';
import 'package:parkingadmin/utils/baseUrl.dart';
import 'package:http/http.dart' as http;
import 'package:parkingadmin/views/components/custom_snackbar.dart';

class PaidController extends GetxController {
  List paidList = RxList.empty(growable: true);
  List unPaidList = RxList.empty(growable: true);
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPaidVehicles();
    fetchUnPaidVehicles();
  }

  fetchPaidVehicles({show_paid = 1}) async {
    var url =
        Uri.parse(baseUrl + 'admin_vehicles.php' + '?show_paid=$show_paid');
    var response = await http.get(url);
    var res = jsonDecode(response.body);
    if (res['success']) {
      paidList.clear();
      paidList.addAll(res['message']);
      customSnackbar('Successfully fetched', 'Paid vehicels', 'success');
    } else {
      customSnackbar('Failed', 'Paid vehicles failed to fetch', 'error');
    }
    update();
    // print(paidList);
  }

  fetchUnPaidVehicles({show_paid = 0}) async {
    var url =
        Uri.parse(baseUrl + 'admin_vehicles.php' + '?show_paid=$show_paid');
    var response = await http.get(url);
    var res = jsonDecode(response.body);
    if (res['success']) {
      unPaidList.clear();
      unPaidList.addAll(res['message']);
      customSnackbar('Successfully fetched', 'Paid vehicels', 'success');
    } else {
      customSnackbar('Failed', 'Paid vehicles failed to fetch', 'error');
    }
    update();
    print(unPaidList);
  }
}
