import 'dart:convert';

class AdminModel {
  String? email;
  String? password;
  String? token;
  String? lastLogin;
  String? createdOn;
  double? totalAmount;

  AdminModel({
    this.email,
    this.password,
    this.token,
    this.lastLogin,
    this.createdOn,
    this.totalAmount
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'token': token,
      'lastlogin': lastLogin,
      'createdon': createdOn,
      'totalamount': totalAmount
    };
  }

  factory AdminModel.fromStore(Map<String, dynamic> data) {
    return AdminModel(
      email: data['email'],
      password: data['password'],
      token: data['token'],
      lastLogin: data['lastlogin'],
      createdOn: data['createdon'],
    );
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      email: map['user']['email'],
      password: map['user']['password'],
      token: map['accessToken'],
      lastLogin: map['user']['lastLogin'],
      createdOn: map['user']['createdOn'],
      totalAmount: map['user']['totalAmount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) => AdminModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminModel(email: $email, password: $password, token: $token, lastLogin: $lastLogin, createdOn: $createdOn, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AdminModel &&
      other.email == email &&
      other.password == password &&
      other.token == token &&
      other.lastLogin == lastLogin &&
      other.createdOn == createdOn;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      password.hashCode ^
      token.hashCode ^
      lastLogin.hashCode ^
      createdOn.hashCode;
  }
}
