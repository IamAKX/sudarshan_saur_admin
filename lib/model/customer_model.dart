import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:saur_admin/model/warranty_model.dart';

import 'address_model.dart';

class CustomerModel {
  int? customerId;
  String? customerName;
  String? mobileNo;
  String? status;
  String? email;
  AddressModel? installationAddress;
  AddressModel? address;
  String? lastLogin;
  String? createdOn;
  String? image;
  String? installerMobile;
  CustomerModel({
    this.customerId,
    this.customerName,
    this.mobileNo,
    this.status,
    this.email,
    this.installationAddress,
    this.address,
    this.lastLogin,
    this.createdOn,
    this.image,
    this.installerMobile,
  });
  

  CustomerModel copyWith({
    int? customerId,
    String? customerName,
    String? mobileNo,
    String? status,
    String? email,
    AddressModel? installationAddress,
    AddressModel? address,
    String? lastLogin,
    String? createdOn,
    String? image,
    String? installerMobile,
  }) {
    return CustomerModel(
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      mobileNo: mobileNo ?? this.mobileNo,
      status: status ?? this.status,
      email: email ?? this.email,
      installationAddress: installationAddress ?? this.installationAddress,
      address: address ?? this.address,
      lastLogin: lastLogin ?? this.lastLogin,
      createdOn: createdOn ?? this.createdOn,
      image: image ?? this.image,
      installerMobile: installerMobile ?? this.installerMobile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(customerId != null){
      result.addAll({'customerId': customerId});
    }
    if(customerName != null){
      result.addAll({'customerName': customerName});
    }
    if(mobileNo != null){
      result.addAll({'mobileNo': mobileNo});
    }
    if(status != null){
      result.addAll({'status': status});
    }
    if(email != null){
      result.addAll({'email': email});
    }
    if(installationAddress != null){
      result.addAll({'installationAddress': installationAddress!.toMap()});
    }
    if(address != null){
      result.addAll({'address': address!.toMap()});
    }
    if(lastLogin != null){
      result.addAll({'lastLogin': lastLogin});
    }
    if(createdOn != null){
      result.addAll({'createdOn': createdOn});
    }
    if(image != null){
      result.addAll({'image': image});
    }
    if(installerMobile != null){
      result.addAll({'installerMobile': installerMobile});
    }
  
    return result;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      customerId: map['customerId']?.toInt(),
      customerName: map['customerName'],
      mobileNo: map['mobileNo'],
      status: map['status'],
      email: map['email'],
      installationAddress: map['installationAddress'] != null ? AddressModel.fromMap(map['installationAddress']) : null,
      address: map['address'] != null ? AddressModel.fromMap(map['address']) : null,
      lastLogin: map['lastLogin'],
      createdOn: map['createdOn'],
      image: map['image'],
      installerMobile: map['installerMobile'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(customerId: $customerId, customerName: $customerName, mobileNo: $mobileNo, status: $status, email: $email, installationAddress: $installationAddress, address: $address, lastLogin: $lastLogin, createdOn: $createdOn, image: $image, installerMobile: $installerMobile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CustomerModel &&
      other.customerId == customerId &&
      other.customerName == customerName &&
      other.mobileNo == mobileNo &&
      other.status == status &&
      other.email == email &&
      other.installationAddress == installationAddress &&
      other.address == address &&
      other.lastLogin == lastLogin &&
      other.createdOn == createdOn &&
      other.image == image &&
      other.installerMobile == installerMobile;
  }

  @override
  int get hashCode {
    return customerId.hashCode ^
      customerName.hashCode ^
      mobileNo.hashCode ^
      status.hashCode ^
      email.hashCode ^
      installationAddress.hashCode ^
      address.hashCode ^
      lastLogin.hashCode ^
      createdOn.hashCode ^
      image.hashCode ^
      installerMobile.hashCode;
  }
  }
