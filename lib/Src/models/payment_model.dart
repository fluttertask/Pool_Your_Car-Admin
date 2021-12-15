import 'dart:convert';

class PaymentModel {
  String? fromName;
  String? toName;
  String? to;
  String? from;
  String? fromId;
  String? date;
  int? amount;

  PaymentModel({
    required this.fromName,
    required this.toName,
    required this.to,
    required this.from,
    required this.fromId,
    required this.date,
    required this.amount,
  });

  PaymentModel copyWith({
    String? fromName,
    String? toName,
    String? to,
    String? from,
    String? fromId,
    String? date,
    int? amount,
  }) {
    return PaymentModel(
      fromName: fromName ?? this.fromName,
      toName: toName ?? this.toName,
      to: to ?? this.to,
      from: from ?? this.from,
      fromId: fromId ?? this.fromId,
      date: date ?? this.date,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fromName': fromName,
      'toName': toName,
      'to': to,
      'from': from,
      'fromId': fromId,
      'date': date,
      'amount': amount,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      fromName: map['fromname'] ?? '',
      toName: map['toname'] ?? '',
      to: map['to'] ?? '',
      from: map['from'] ?? '',
      fromId: map['fromid'] ?? '',
      date: map['date'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) => PaymentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentModel(fromName: $fromName, toName: $toName, to: $to, from: $from, fromId: $fromId, date: $date, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is PaymentModel &&
      other.fromName == fromName &&
      other.toName == toName &&
      other.to == to &&
      other.from == from &&
      other.fromId == fromId &&
      other.date == date &&
      other.amount == amount;
  }

  @override
  int get hashCode {
    return fromName.hashCode ^
      toName.hashCode ^
      to.hashCode ^
      from.hashCode ^
      fromId.hashCode ^
      date.hashCode ^
      amount.hashCode;
  }
}
