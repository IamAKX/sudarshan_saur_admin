import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/address_model.dart';
import 'package:saur_admin/model/dealer_model.dart';

class StockistModel {
  int? stockistId;
  String? stockistName;
  String? password;
  String? mobileNo;
  String? status;
  String? email;
  AddressModel? address;
  String? image;
  String? lastLogin;
  String? businessName;
  String? businessAddress;
  String? gstNumber;
  String? updatedOn;
  String? createdOn;
  List<DealerModel>? dealers;
  StockistModel({
    this.stockistId,
    this.stockistName,
    this.password,
    this.mobileNo,
    this.status,
    this.email,
    this.address,
    this.image,
    this.lastLogin,
    this.businessName,
    this.businessAddress,
    this.gstNumber,
    this.updatedOn,
    this.createdOn,
    this.dealers,
  });

  StockistModel copyWith({
    int? stockistId,
    String? stockistName,
    String? password,
    String? mobileNo,
    String? status,
    String? email,
    AddressModel? address,
    String? image,
    String? lastLogin,
    String? businessName,
    String? businessAddress,
    String? gstNumber,
    String? updatedOn,
    String? createdOn,
    List<DealerModel>? dealers,
  }) {
    return StockistModel(
      stockistId: stockistId ?? this.stockistId,
      stockistName: stockistName ?? this.stockistName,
      password: password ?? this.password,
      mobileNo: mobileNo ?? this.mobileNo,
      status: status ?? this.status,
      email: email ?? this.email,
      address: address ?? this.address,
      image: image ?? this.image,
      lastLogin: lastLogin ?? this.lastLogin,
      businessName: businessName ?? this.businessName,
      businessAddress: businessAddress ?? this.businessAddress,
      gstNumber: gstNumber ?? this.gstNumber,
      updatedOn: updatedOn ?? this.updatedOn,
      createdOn: createdOn ?? this.createdOn,
      dealers: dealers ?? this.dealers,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stockistId': stockistId,
      'stockistName': stockistName,
      'password': password,
      'mobileNo': mobileNo,
      'status': status,
      'email': email,
      'address': address?.toMap(),
      'image': image,
      'lastLogin': lastLogin,
      'businessName': businessName,
      'businessAddress': businessAddress,
      'gstNumber': gstNumber,
      'updatedOn': updatedOn,
      'createdOn': createdOn,
      'dealers': dealers?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory StockistModel.fromMap(Map<String, dynamic> map) {
    return StockistModel(
      stockistId: map['stockistId']?.toInt(),
      stockistName: map['stockistName'],
      password: map['password'],
      mobileNo: map['mobileNo'],
      status: map['status'],
      email: map['email'],
      address: map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      image: map['image'],
      lastLogin: map['lastLogin'],
      businessName: map['businessName'],
      businessAddress: map['businessAddress'],
      gstNumber: map['gstNumber'],
      updatedOn: map['updatedOn'],
      createdOn: map['createdOn'],
      dealers: map['dealers'] != null ? List<DealerModel>.from(map['dealers']?.map((x) => DealerModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StockistModel.fromJson(String source) => StockistModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StockistModel(stockistId: $stockistId, stockistName: $stockistName, password: $password, mobileNo: $mobileNo, status: $status, email: $email, address: $address, image: $image, lastLogin: $lastLogin, businessName: $businessName, businessAddress: $businessAddress, gstNumber: $gstNumber, updatedOn: $updatedOn, createdOn: $createdOn, dealers: $dealers)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StockistModel &&
      other.stockistId == stockistId &&
      other.stockistName == stockistName &&
      other.password == password &&
      other.mobileNo == mobileNo &&
      other.status == status &&
      other.email == email &&
      other.address == address &&
      other.image == image &&
      other.lastLogin == lastLogin &&
      other.businessName == businessName &&
      other.businessAddress == businessAddress &&
      other.gstNumber == gstNumber &&
      other.updatedOn == updatedOn &&
      other.createdOn == createdOn &&
      listEquals(other.dealers, dealers);
  }

  @override
  int get hashCode {
    return stockistId.hashCode ^
      stockistName.hashCode ^
      password.hashCode ^
      mobileNo.hashCode ^
      status.hashCode ^
      email.hashCode ^
      address.hashCode ^
      image.hashCode ^
      lastLogin.hashCode ^
      businessName.hashCode ^
      businessAddress.hashCode ^
      gstNumber.hashCode ^
      updatedOn.hashCode ^
      createdOn.hashCode ^
      dealers.hashCode;
  }
}
