import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/warranty_model.dart';

class ListWarrantyModel {
  List<WarrantyModel>? data;
  ListWarrantyModel({
    this.data,
  });

  ListWarrantyModel copyWith({
    List<WarrantyModel>? data,
  }) {
    return ListWarrantyModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ListWarrantyModel.fromMap(Map<String, dynamic> map) {
    return ListWarrantyModel(
      data: map['data'] != null
          ? List<WarrantyModel>.from(
              map['data']?.map((x) => WarrantyModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListWarrantyModel.fromJson(String source) =>
      ListWarrantyModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListWarrantyModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListWarrantyModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
