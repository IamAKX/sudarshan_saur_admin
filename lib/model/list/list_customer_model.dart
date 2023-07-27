import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/customer_model.dart';

class ListCustomerModel {
  List<CustomerModel>? data;
  ListCustomerModel({
    this.data,
  });

  ListCustomerModel copyWith({
    List<CustomerModel>? data,
  }) {
    return ListCustomerModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ListCustomerModel.fromMap(Map<String, dynamic> map) {
    return ListCustomerModel(
      data: map['data'] != null ? List<CustomerModel>.from(map['data']?.map((x) => CustomerModel.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCustomerModel.fromJson(String source) => ListCustomerModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListCustomerModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListCustomerModel &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
