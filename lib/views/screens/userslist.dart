import 'package:flutter/material.dart';
import 'package:parkingadmin/views/components/custom_app_bar.dart';
import 'package:parkingadmin/views/components/cutom_drawer.dart';

class UsersListScreen extends StatelessWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      'List of current users.',
                      style: TextStyle(fontSize: 20, color: Color(0xff154C79)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Pratima Gurung',
                            style: TextStyle(
                                fontSize: 22, color: Color(0xff154C79)),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Email:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff154C79)),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Text(
                                  'pratimagurung308@gmail.com',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff154C79)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Contact:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff154C79)),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Text(
                                  '9811469071',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff154C79)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Row(
                            children: const [
                              Text(
                                'Address:',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff154C79)),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Expanded(
                                child: Text(
                                  'Malepatan',
                                  style: TextStyle(
                                      fontSize: 18, color: Color(0xff154C79)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
