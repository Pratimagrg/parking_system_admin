import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingadmin/controllers/paid_controller.dart';
import 'package:parkingadmin/utils/colors.dart';
import 'package:parkingadmin/views/components/custom_app_bar.dart';
import 'package:parkingadmin/views/components/cutom_drawer.dart';

class PaidScreen extends StatelessWidget {
  PaidScreen({Key? key}) : super(key: key);

  final paidController = Get.put(PaidController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: GetBuilder<PaidController>(builder: (controller) {
          return SafeArea(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Paid',
                          style: TextStyle(
                              color: CustomColors.themecolor, fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'UnPaid',
                          style: TextStyle(
                              color: CustomColors.themecolor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: controller.paidList
                                    .map((e) => PaidVehicles(vehicles: e))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: controller.unPaidList
                                    .map((e) => PaidVehicles(vehicles: e))
                                    .toList(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
        }));
  }
}

class PaidVehicles extends StatelessWidget {
  const PaidVehicles({
    Key? key,
    required this.vehicles,
  }) : super(key: key);

  final dynamic vehicles;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x60000000),
            offset: Offset(0, 6),
            blurRadius: 6,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                vehicles['number'],
                style: const TextStyle(fontSize: 22, color: Color(0xff154C79)),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                vehicles['brand'],
                style: const TextStyle(fontSize: 16, color: Color(0xff154C79)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
