import 'package:get/get.dart';
import '../pages/home_page.dart';

class Routes {
  static final initial = '/home';
  static final route = [
    GetPage(name: '/home', page: () => HomePage()),
  ];
}
