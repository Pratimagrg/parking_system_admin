import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingadmin/routes.dart';
import 'package:parkingadmin/utils/shared_prefs.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Drawer(
        backgroundColor: const Color(0xff154C79),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.zero,
              decoration: const BoxDecoration(
                color: Color(0xff154C79),
              ),
              child: Image.asset(
                'assets/images/parkinglogo.png',
                height: 80,
                width: 80,
              ),
            ),
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              onTap: () {
                Get.toNamed(GetRoutes.home);
              },
            ),
            // ListTile(
            //   title: const Text(
            //     'View users',
            //     style: TextStyle(color: Colors.white, fontSize: 19),
            //   ),
            //   onTap: () {
            //     Get.toNamed(GetRoutes.userlist);
            //   },
            // ),
            ListTile(
              title: const Text('Paid and UnPaid',
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              onTap: () {
                Get.toNamed(GetRoutes.paid);
              },
            ),
            ListTile(
              title: const Text('Logout',
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Logout?'),
                          content:
                              const Text('Are you sure you want to logout?'),
                          actions: [
                            RaisedButton(
                              onPressed: () async {
                                await SharedPrefs().removeUser();
                                Get.offAllNamed(GetRoutes.login);
                              },
                              child: const Text('Yes'),
                            ),
                            RaisedButton(
                              color: Colors.red,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
