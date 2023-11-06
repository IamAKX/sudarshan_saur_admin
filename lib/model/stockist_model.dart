import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/address_model.dart';
import 'package:saur_admin/model/dealer_model.dart';

class StockistModel {
 int? stockistId;
  String? stockistName;
  String? mobileNo;
  String? status;
  String? email;
  AddressModel? address;
  String? createdOn;
  String? updatedOn;
  String? lastLogin;
  String? image;
  String? businessName;
  String? gstNumber;
  String? stockistCode;
  StockistModel({
    this.stockistId,
    this.stockistName,
    this.mobileNo,
    this.status,
    this.email,
    this.address,
    this.createdOn,
    this.updatedOn,
    this.lastLogin,
    this.image,
    this.businessName,
    this.gstNumber,
    this.stockistCode,
  });

  StockistModel copyWith({
    int? stockistId,
    String? stockistName,
    String? mobileNo,
    String? status,
    String? email,
    AddressModel? address,
    String? createdOn,
    String? updatedOn,
    String? lastLogin,
    String? image,
    String? businessName,
    String? gstNumber,
    String? stockistCode,
  }) {
    return StockistModel(
      stockistId: stockistId ?? this.stockistId,
      stockistName: stockistName ?? this.stockistName,
      mobileNo: mobileNo ?? this.mobileNo,
      status: status ?? this.status,
      email: email ?? this.email,
      address: address ?? this.address,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      lastLogin: lastLogin ?? this.lastLogin,
      image: image ?? this.image,
      businessName: businessName ?? this.businessName,
      gstNumber: gstNumber ?? this.gstNumber,
      stockistCode: stockistCode ?? this.stockistCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stockistId': stockistId,
      'stockistName': stockistName,
      'mobileNo': mobileNo,
      'status': status,
      'email': email,
      'address': address?.toMap(),
      'createdOn': createdOn,
      'updatedOn': updatedOn,
      'lastLogin': lastLogin,
      'image': image,
      'businessName': businessName,
      'gstNumber': gstNumber,
      'stockistCode': stockistCode,
    };
  }

  factory StockistModel.fromMap(Map<String, dynamic> map) {
    return StockistModel(
      stockistId: map['stockistId']?.toInt(),
      stockistName: map['stockistName'],
      mobileNo: map['mobileNo'],
      status: map['status'],
      email: map['email'],
      address: map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
      lastLogin: map['lastLogin'],
      image: map['image'],
      businessName: map['businessName'],
      gstNumber: map['gstNumber'],
      stockistCode: map['stockistCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StockistModel.fromJson(String source) => StockistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StockistModel(stockistId: $stockistId, stockistName: $stockistName, mobileNo: $mobileNo, status: $status, email: $email, address: $address, createdOn: $createdOn, updatedOn: $updatedOn, lastLogin: $lastLogin, image: $image, businessName: $businessName, gstNumber: $gstNumber, stockistCode: $stockistCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StockistModel &&
      other.stockistId == stockistId &&
      other.stockistName == stockistName &&
      other.mobileNo == mobileNo &&
      other.status == status &&
      other.email == email &&
      other.address == address &&
      other.createdOn == createdOn &&
      other.updatedOn == updatedOn &&
      other.lastLogin == lastLogin &&
      other.image == image &&
      other.businessName == businessName &&
      other.gstNumber == gstNumber &&
      other.stockistCode == stockistCode;
  }

  @override
  int get hashCode {
    return stockistId.hashCode ^
      stockistName.hashCode ^
      mobileNo.hashCode ^
      status.hashCode ^
      email.hashCode ^
      address.hashCode ^
      createdOn.hashCode ^
      updatedOn.hashCode ^
      lastLogin.hashCode ^
      image.hashCode ^
      businessName.hashCode ^
      gstNumber.hashCode ^
      stockistCode.hashCode;
  }
}
