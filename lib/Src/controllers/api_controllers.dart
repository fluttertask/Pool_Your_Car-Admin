import 'dart:convert';
import 'package:adminapp/Src/constants/api_url.dart';
import 'package:adminapp/Src/models/admin_model.dart';
import 'package:adminapp/Src/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiControllers extends GetxController{
  Rx<AdminModel> currentUser = AdminModel().obs;
  List<UserModel> allUsers = <UserModel>[];
  RxList<UserModel> searchedUsers = <UserModel>[].obs;
  

  http.Client client = http.Client();

  Future<void> getUser() async {
    Uri url = getUri(ApiUrl.getUsers);
    http.Response response = await client.get(
      url,
      headers : {
        "Content-Type": "application/json",
      }
    );
    allUsers = (json.decode(response.body) as List).map((e) => UserModel.fromMap(e)).toList();
    searchedUsers.value = allUsers;
  }


  Future<void> searchUsers(text) async{
    if (text == '') {
      searchedUsers.value = allUsers;
    }else{
      searchedUsers.value = [];
      for (var e in allUsers) {
        if (e.firstname!.startsWith(text) || e.lastname!.startsWith(text) || e.phonenumber!.contains(text)) {
          searchedUsers.add(e);
        }
      }
    }
  }

  Future<void> init() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString('user')!;
    currentUser.value = AdminModel.fromStore(jsonDecode(user));
  }

  Future<void> login(AdminModel adminModel) async {
    Uri url = getUri(ApiUrl.login);
    http.Response response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': adminModel.email,
        'password': adminModel.password
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      currentUser.value = AdminModel.fromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', currentUser.value.toJson());
    }
  }

  Future<void> blockUser(UserModel user) async {
    Uri uri = getUri(ApiUrl.blockUser);
    http.Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer ${currentUser.value.token}"
      },
      body: jsonEncode({
        'id': user.id,
      })
    );

    print(response.body);
  }

  Future<void> unBlockUser(UserModel user) async {
    Uri uri = getUri(ApiUrl.unBlockUser);
    http.Response response = await client.post(
      uri,
      headers: {
        'Content-Type': "application/json",
        'authorization': 'Bearer ${currentUser.value.token}'
      },
      body: jsonEncode({
        'id': user.id,
      })
    );

    print(response.body);
  }

  Future<void> sendCredit(UserModel user, int amount) async {
    Uri uri = getUri(ApiUrl.sendCredit);
    http.Response response = await client.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "authorization": "Bearer ${currentUser.value.token}"
      },
      body: jsonEncode({
        'id': user.id,
        'amountSent': amount,
      })
    );

    print(response.body);
  }

  Future<void> logout() async {
    currentUser.value = AdminModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}