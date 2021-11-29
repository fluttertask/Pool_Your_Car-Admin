import 'package:adminapp/UI/pages/all_users.dart';
import 'package:adminapp/UI/pages/blocked_users.dart';
import 'package:adminapp/UI/pages/home.dart';
import 'package:adminapp/UI/pages/login.dart';
import 'package:adminapp/UI/pages/splash.dart';
import 'package:get/get.dart';

class Routes{
  static String home = '/homePage';
  static String login = '/loginPage';
  static String splash = '/splashPage';
  static String allUsers = '/allUsersPage';
  static String blockedUsers = '/blockedUsersPage';

  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: allUsers, page: () => const AllUsersPage()),
    GetPage(name: blockedUsers, page: () => const BlockedUsersPage()),
  ];
}