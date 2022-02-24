import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingadmin/controllers/home_controller.dart';
import 'package:parkingadmin/utils/colors.dart';
import 'package:parkingadmin/views/components/category_tile.dart';
import 'package:parkingadmin/views/components/custom_app_bar.dart';
import 'package:parkingadmin/views/components/cutom_drawer.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<HomeController>(HomeController());
    return Scaffold(
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Available vehicle categories',
                  style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                ),
                const SizedBox(
                  height: 20,
                ),
                // CategoryTile(
                //   onTap: () => showButtomModal(context),
                // )
                Obx(() => controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        children: controller.categories.map((e) {
                        return CategoryTile(
                            category: e,
                            onTap: () {
                              controller.updateAllFields(e);
                              showButtomModal(context, e);
                            });
                      }).toList())),
              ],
            ),
          ),
        )));
  }

  showButtomModal(context, e) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return EditContainer(
            category: e,
          );
        });
  }
}

class EditContainer extends GetView<HomeController> {
  const EditContainer({
    Key? key,
    required this.category,
  }) : super(key: key);
  final dynamic category;
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Container(
      height: 380,
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Category Name: ',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.themecolor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Cost per hour: ',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.themecolor),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Total slots: ',
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.themecolor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 28,
                    width: 90,
                    child: TextFormField(
                      // controller: controller.categoryNameController,
                      onChanged: (value) {
                        controller.categoryNameController.value = value;
                      },
                      initialValue: controller.categoryNameController.value,
                      //  decoration: const InputDecoration(labelText: '10'),
                      style: const TextStyle(
                          color: CustomColors.themecolor, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 28,
                    width: 90,
                    child: TextFormField(
                      onChanged: (value) {
                        controller.costController.value = value;
                      },
                      initialValue: controller.costController.value,
                      style: const TextStyle(
                          color: CustomColors.themecolor, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 28,
                    width: 90,
                    child: TextFormField(
                      onChanged: (value) {
                        controller.slotController.value = value;
                      },
                      initialValue: controller.slotController.value,
                      style: const TextStyle(
                          color: CustomColors.themecolor, fontSize: 18),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 45,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  controller.updateCategory();
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.green.shade700),
                  height: 43,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: Colors.red.shade700),
                  height: 43,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
