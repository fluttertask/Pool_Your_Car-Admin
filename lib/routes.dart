import 'package:adminapp/UI/pages/admin.dart';
import 'package:adminapp/UI/pages/all_users.dart';
import 'package:adminapp/UI/pages/blocked_users.dart';
import 'package:adminapp/UI/pages/credit_users.dart';
import 'package:adminapp/UI/pages/home.dart';
import 'package:adminapp/UI/pages/login.dart';
import 'package:adminapp/UI/pages/payment.dart';
import 'package:adminapp/UI/pages/splash.dart';
import 'package:get/get.dart';

class Routes{
  static String home = '/homePage';
  static String admin = '/adminPage';
  static String login= '/loginPage';
  static String splash = '/splashPage';
  static String payment = '/paymentPage';
  static String allUsers = '/allUsersPage';
  static String creditUsers = '/creditUsersPage';
  static String blockedUsers = '/blockedUsersPage';


  static List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: admin, page: () => const AdminPage()),
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: payment, page: () => const PaymentPage()),
    GetPage(name: allUsers, page: () => const AllUsersPage()),
    GetPage(name: creditUsers, page: () => const CreditUsersPage()),
    GetPage(name: blockedUsers, page: () => const BlockedUsersPage()),
  ];
}