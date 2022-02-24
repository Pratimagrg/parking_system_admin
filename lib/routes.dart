import 'package:get/get.dart';
import 'package:parkingadmin/views/screens/home.dart';
import 'package:parkingadmin/views/screens/login.dart';
import 'package:parkingadmin/views/screens/paid.dart';
import 'package:parkingadmin/views/screens/userslist.dart';

class GetRoutes {
  static const login = '/login';
  static const home = '/home';
  static const userlist = '/userlist';
  static const paid = '/paid';

  static List<GetPage> routes = [
    GetPage(name: GetRoutes.login, page: () => LoginScreen()),
    GetPage(name: GetRoutes.home, page: () => HomeScreen()),
    GetPage(name: GetRoutes.userlist, page: () => const UsersListScreen()),
    GetPage(name: GetRoutes.paid, page: () => PaidScreen())
  ];
}
