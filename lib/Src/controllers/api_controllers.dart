import 'dart:convert';
import 'package:adminapp/Src/constants/api_url.dart';
import 'package:adminapp/Src/models/admin_model.dart';
import 'package:adminapp/Src/models/payment_model.dart';
import 'package:adminapp/Src/models/user_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiControllers extends GetxController{
  Rx<AdminModel> currentUser = AdminModel().obs;
  List<UserModel> allUsers = <UserModel>[];
  List<PaymentModel> allPayments = <PaymentModel>[];
  RxList<UserModel> searchedUsers = <UserModel>[].obs;
  RxList<PaymentModel> searchedPayments = <PaymentModel>[].obs;
  

  http.Client client = http.Client();

  Future<http.Response> getUser() async {
    Uri url = getUri(ApiUrl.getUsers);
    http.Response response = await client.get(
      url,
      headers : {
        "Content-Type": "application/json",
      }
    );

    if (response.statusCode == 200){
      allUsers = (json.decode(response.body) as List).map((e) => UserModel.fromMap(e)).toList();
      searchedUsers.value = allUsers;
    }
   

    return response;
  }

  Future<http.Response> getAllPayments() async {
    Uri url = getUri(ApiUrl.getAllPayments);
    http.Response response = await client.get(
      url,
      headers : {
        "Content-Type": "application/json",
        "authorization": "Bearer ${currentUser.value.token}"
      },
    );
    
    if (response.statusCode == 200) {
      allPayments = (json.decode(response.body) as List).map((e) => PaymentModel.fromMap(e)).toList();
      searchedPayments.value = allPayments;
    }
    

    return response;
  }

  Future<void> searchPayments(text) async{
    if (text == '') {
      searchedPayments.value = allPayments;
    }else{
      searchedPayments.value = [];
      for (var e in allPayments) {
        if (e.toName!.contains(text) || e.fromName!.contains(text) || e.from!.contains(text) || e.to!.contains(text)) {
          searchedPayments.add(e);
        }
      }
    }
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

  Future<http.Response> login(AdminModel adminModel) async {
    Uri url = getUri(ApiUrl.login);
    http.Response response = await client.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': adminModel.email,
        'password': adminModel.password
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      currentUser.value = AdminModel.fromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('user', currentUser.value.toJson());
    }

    return response;
  }

  Future<http.Response> blockUser(UserModel user) async {
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
    return response;
  }

  Future<http.Response> unBlockUser(UserModel user) async {
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
    return response;

  }

  Future<http.Response> sendCredit(UserModel user, int amount) async {
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
        'receiverId': user.phonenumber
      })
    );

    return response;
  }

  Future<void> logout() async {
    currentUser.value = AdminModel();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}