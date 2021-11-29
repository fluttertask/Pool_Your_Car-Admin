class ApiUrl {
  static const String  _base = 'http://poolyourcar.herokuapp.com';
  static String login = '$_base/api/admin/login';
  static String getUsers = '$_base/api/user/getalluser';
  static String blockUser = '$_base/api/admin/blockuser';
  static String unBlockUser = '$_base/api/admin/unblockuser';
}

Uri getUri(String path) {
  // ignore: avoid_print
  print(Uri.parse(path));
  return Uri.parse(path);
}
