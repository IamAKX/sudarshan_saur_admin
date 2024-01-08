import 'dart:convert';

class SdwModel {
  int? id;
  int? stockistId;
  int? dealerId;
  String? warrantySerialNo;
  String? createdOn;
  String? updatedOn;
  SdwModel({
    this.id,
    this.stockistId,
    this.dealerId,
    this.warrantySerialNo,
    this.createdOn,
    this.updatedOn,
  });

  SdwModel copyWith({
    int? id,
    int? stockistId,
    int? dealerId,
    String? warrantySerialNo,
    String? createdOn,
    String? updatedOn,
  }) {
    return SdwModel(
      id: id ?? this.id,
      stockistId: stockistId ?? this.stockistId,
      dealerId: dealerId ?? this.dealerId,
      warrantySerialNo: warrantySerialNo ?? this.warrantySerialNo,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (stockistId != null) {
      result.addAll({'stockistId': stockistId});
    }
    if (dealerId != null) {
      result.addAll({'dealerId': dealerId});
    }
    if (warrantySerialNo != null) {
      result.addAll({'warrantySerialNo': warrantySerialNo});
    }
    if (createdOn != null) {
      result.addAll({'createdOn': createdOn});
    }
    if (updatedOn != null) {
      result.addAll({'updatedOn': updatedOn});
    }

    return result;
  }

  factory SdwModel.fromMap(Map<String, dynamic> map) {
    return SdwModel(
      id: map['id']?.toInt(),
      stockistId: map['stockistId']?.toInt(),
      dealerId: map['dealerId']?.toInt(),
      warrantySerialNo: map['warrantySerialNo'],
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SdwModel.fromJson(String source) =>
      SdwModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SdwModel(id: $id, stockistId: $stockistId, dealerId: $dealerId, warrantySerialNo: $warrantySerialNo, createdOn: $createdOn, updatedOn: $updatedOn)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SdwModel &&
        other.id == id &&
        other.stockistId == stockistId &&
        other.dealerId == dealerId &&
        other.warrantySerialNo == warrantySerialNo &&
        other.createdOn == createdOn &&
        other.updatedOn == updatedOn;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        stockistId.hashCode ^
        dealerId.hashCode ^
        warrantySerialNo.hashCode ^
        createdOn.hashCode ^
        updatedOn.hashCode;
  }
}
