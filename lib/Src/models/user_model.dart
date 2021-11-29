import 'dart:convert';

import 'package:collection/collection.dart';



class UserModel {
  List<dynamic>? offeredride;
  List<dynamic>? bookedride;
  List<dynamic>? pastofferedride;
  List<dynamic>? pastbookedride;
  String? id;
  String? blocked;
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? email;
  DateTime? createdat;
  
  UserModel({
    this.offeredride,
    this.bookedride,
    this.pastofferedride,
    this.pastbookedride,
    this.id,
    this.blocked,
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.email,
    this.createdat,
  });

  UserModel copyWith({
    List<dynamic>? offeredride,
    List<dynamic>? bookedride,
    List<dynamic>? pastofferedride,
    List<dynamic>? pastbookedride,
    String? id,
    String? blocked,
    String? firstname,
    String? lastname,
    String? phonenumber,
    String? email,
    DateTime? createdat,
  }) {
    return UserModel(
      offeredride: offeredride ?? this.offeredride,
      bookedride: bookedride ?? this.bookedride,
      pastofferedride: pastofferedride ?? this.pastofferedride,
      pastbookedride: pastbookedride ?? this.pastbookedride,
      id: id ?? this.id,
      blocked: blocked?? this.blocked,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phonenumber: phonenumber ?? this.phonenumber,
      email: email ?? this.email,
      createdat: createdat ?? this.createdat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'offeredride': offeredride,
      'bookedride': bookedride,
      'pastofferedride': pastofferedride,
      'pastbookedride': pastbookedride,
      'id': id,
      'blocked': blocked,
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
      'email': email,
      'createdat': createdat!.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      offeredride: List<dynamic>.from(map['offeredride']),
      bookedride: List<dynamic>.from(map['bookedride']),
      pastofferedride: List<dynamic>.from(map['pastofferedride']),
      pastbookedride: List<dynamic>.from(map['pastbookedride']),
      id: map['_id'],
      blocked: map['blocked'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      phonenumber: map['phonenumber'],
      email: map['email'],
      createdat: map['createdOn']
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(offeredride: $offeredride, bookedride: $bookedride, pastofferedride: $pastofferedride, pastbookedride: $pastbookedride, id: $id, blocked: $blocked, firstname: $firstname, lastname: $lastname, phonenumber: $phonenumber, email: $email, createdat: $createdat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is UserModel &&
      listEquals(other.offeredride, offeredride) &&
      listEquals(other.bookedride, bookedride) &&
      listEquals(other.pastofferedride, pastofferedride) &&
      listEquals(other.pastbookedride, pastbookedride) &&
      other.id == id &&
      other.blocked == blocked &&
      other.firstname == firstname &&
      other.lastname == lastname &&
      other.phonenumber == phonenumber &&
      other.email == email &&
      other.createdat == createdat;
  }

  @override
  int get hashCode {
    return offeredride.hashCode ^
      bookedride.hashCode ^
      pastofferedride.hashCode ^
      pastbookedride.hashCode ^
      id.hashCode ^
      blocked.hashCode ^
      firstname.hashCode ^
      lastname.hashCode ^
      phonenumber.hashCode ^
      email.hashCode ^
      createdat.hashCode;
  }
}
