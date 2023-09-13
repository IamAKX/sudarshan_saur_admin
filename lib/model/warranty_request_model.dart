import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/cust_dealer_model.dart';
import 'package:saur_admin/model/customer_model.dart';
import 'package:saur_admin/model/plumber_model.dart';
import 'package:saur_admin/model/question_answer_model.dart';
import 'package:saur_admin/model/technician_model.dart';
import 'package:saur_admin/model/warranty_model.dart';

import 'address_model.dart';
import 'images_model.dart';

class WarrantyRequestModel {
  CustomerModel? customers;
  String? mobile2;
  int? requestId;
  AddressModel? installationAddress;
  AddressModel? ownerAddress;
  WarrantyModel? warrantyDetails;
  CustDealerModel? dealerInfo;
  TechnicianModel? technicianInfo;
  PlumberModel? plumberInfo;
  List<QuestionAnswerModel>? answers;
  String? status;
  ImagesModel? images;
  String? createdOn;
  String? updatedOn;
  String? initUserType;
  String? initiatedBy;
  String? approvedBy;
  String? installationDate;
  String? invoiceDate;
  String? invoiceNumber;
  String? lat;
  String? lon;
  WarrantyRequestModel({
    this.customers,
    this.mobile2,
    this.requestId,
    this.installationAddress,
    this.ownerAddress,
    this.warrantyDetails,
    this.dealerInfo,
    this.technicianInfo,
    this.plumberInfo,
    this.answers,
    this.status,
    this.images,
    this.createdOn,
    this.updatedOn,
    this.initUserType,
    this.initiatedBy,
    this.approvedBy,
    this.installationDate,
    this.invoiceDate,
    this.invoiceNumber,
    this.lat,
    this.lon,
  });

  WarrantyRequestModel copyWith({
    CustomerModel? customers,
    String? mobile2,
    int? requestId,
    AddressModel? installationAddress,
    AddressModel? ownerAddress,
    WarrantyModel? warrantyDetails,
    CustDealerModel? dealerInfo,
    TechnicianModel? technicianInfo,
    PlumberModel? plumberInfo,
    List<QuestionAnswerModel>? answers,
    String? status,
    ImagesModel? images,
    String? createdOn,
    String? updatedOn,
    String? initUserType,
    String? initiatedBy,
    String? approvedBy,
    String? installationDate,
    String? invoiceDate,
    String? invoiceNumber,
    String? lat,
    String? lon,
  }) {
    return WarrantyRequestModel(
      customers: customers ?? this.customers,
      mobile2: mobile2 ?? this.mobile2,
      requestId: requestId ?? this.requestId,
      installationAddress: installationAddress ?? this.installationAddress,
      ownerAddress: ownerAddress ?? this.ownerAddress,
      warrantyDetails: warrantyDetails ?? this.warrantyDetails,
      dealerInfo: dealerInfo ?? this.dealerInfo,
      technicianInfo: technicianInfo ?? this.technicianInfo,
      plumberInfo: plumberInfo ?? this.plumberInfo,
      answers: answers ?? this.answers,
      status: status ?? this.status,
      images: images ?? this.images,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      initUserType: initUserType ?? this.initUserType,
      initiatedBy: initiatedBy ?? this.initiatedBy,
      approvedBy: approvedBy ?? this.approvedBy,
      installationDate: installationDate ?? this.installationDate,
      invoiceDate: invoiceDate ?? this.invoiceDate,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customers': customers?.toMap(),
      'mobile2': mobile2,
      'requestId': requestId,
      'installationAddress': installationAddress?.toMap(),
      'ownerAddress': ownerAddress?.toMap(),
      'warrantyDetails': warrantyDetails?.toMap(),
      'dealerInfo': dealerInfo?.toMap(),
      'technicianInfo': technicianInfo?.toMap(),
      'plumberInfo': plumberInfo?.toMap(),
      'answers': answers?.map((x) => x?.toMap())?.toList(),
      'status': status,
      'images': images?.toMap(),
      'createdOn': createdOn,
      'updatedOn': updatedOn,
      'initUserType': initUserType,
      'initiatedBy': initiatedBy,
      'approvedBy': approvedBy,
      'installationDate': installationDate,
      'invoiceDate': invoiceDate,
      'invoiceNumber': invoiceNumber,
      'lat': lat,
      'lon': lon,
    };
  }

  factory WarrantyRequestModel.fromMap(Map<String, dynamic> map) {
    return WarrantyRequestModel(
      customers: map['customers'] != null
          ? CustomerModel.fromMap(map['customers'])
          : null,
      mobile2: map['mobile2'],
      requestId: map['requestId']?.toInt(),
      installationAddress: map['installationAddress'] != null
          ? AddressModel.fromMap(map['installationAddress'])
          : null,
      ownerAddress: map['ownerAddress'] != null
          ? AddressModel.fromMap(map['ownerAddress'])
          : null,
      warrantyDetails: map['warrantyDetails'] != null
          ? WarrantyModel.fromMap(map['warrantyDetails'])
          : null,
      dealerInfo: map['dealerInfo'] != null
          ? CustDealerModel.fromMap(map['dealerInfo'])
          : null,
      technicianInfo: map['technicianInfo'] != null
          ? TechnicianModel.fromMap(map['technicianInfo'])
          : null,
      plumberInfo: map['plumberInfo'] != null
          ? PlumberModel.fromMap(map['plumberInfo'])
          : null,
      answers: map['answers'] != null
          ? List<QuestionAnswerModel>.from(
              map['answers']?.map((x) => QuestionAnswerModel.fromMap(x)))
          : null,
      status: map['status'],
      images: map['images'] != null ? ImagesModel.fromMap(map['images']) : null,
      createdOn: map['createdOn'],
      updatedOn: map['updatedOn'],
      initUserType: map['initUserType'],
      initiatedBy: map['initiatedBy'],
      approvedBy: map['approvedBy'],
      installationDate: map['installationDate'],
      invoiceDate: map['invoiceDate'],
      invoiceNumber: map['invoiceNumber'],
      lat: map['lat'],
      lon: map['lon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WarrantyRequestModel.fromJson(String source) =>
      WarrantyRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WarrantyRequestModel(customers: $customers, mobile2: $mobile2, requestId: $requestId, installationAddress: $installationAddress, ownerAddress: $ownerAddress, warrantyDetails: $warrantyDetails, dealerInfo: $dealerInfo, technicianInfo: $technicianInfo, plumberInfo: $plumberInfo, answers: $answers, status: $status, images: $images, createdOn: $createdOn, updatedOn: $updatedOn, initUserType: $initUserType, initiatedBy: $initiatedBy, approvedBy: $approvedBy, installationDate: $installationDate, invoiceDate: $invoiceDate, invoiceNumber: $invoiceNumber, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WarrantyRequestModel &&
        other.customers == customers &&
        other.mobile2 == mobile2 &&
        other.requestId == requestId &&
        other.installationAddress == installationAddress &&
        other.ownerAddress == ownerAddress &&
        other.warrantyDetails == warrantyDetails &&
        other.dealerInfo == dealerInfo &&
        other.technicianInfo == technicianInfo &&
        other.plumberInfo == plumberInfo &&
        listEquals(other.answers, answers) &&
        other.status == status &&
        other.images == images &&
        other.createdOn == createdOn &&
        other.updatedOn == updatedOn &&
        other.initUserType == initUserType &&
        other.initiatedBy == initiatedBy &&
        other.approvedBy == approvedBy &&
        other.installationDate == installationDate &&
        other.invoiceDate == invoiceDate &&
        other.invoiceNumber == invoiceNumber &&
        other.lat == lat &&
        other.lon == lon;
  }

  @override
  int get hashCode {
    return customers.hashCode ^
        mobile2.hashCode ^
        requestId.hashCode ^
        installationAddress.hashCode ^
        ownerAddress.hashCode ^
        warrantyDetails.hashCode ^
        dealerInfo.hashCode ^
        technicianInfo.hashCode ^
        plumberInfo.hashCode ^
        answers.hashCode ^
        status.hashCode ^
        images.hashCode ^
        createdOn.hashCode ^
        updatedOn.hashCode ^
        initUserType.hashCode ^
        initiatedBy.hashCode ^
        approvedBy.hashCode ^
        installationDate.hashCode ^
        invoiceDate.hashCode ^
        invoiceNumber.hashCode ^
        lat.hashCode ^
        lon.hashCode;
  }
}
