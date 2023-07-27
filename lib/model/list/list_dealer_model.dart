import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/dealer_model.dart';

class ListDealerModel {
  List<DealerModel>? data;
  ListDealerModel({
    this.data,
  });

  ListDealerModel copyWith({
    List<DealerModel>? data,
  }) {
    return ListDealerModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ListDealerModel.fromMap(Map<String, dynamic> map) {
    return ListDealerModel(
      data: map['data'] != null
          ? List<DealerModel>.from(
              map['data']?.map((x) => DealerModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListDealerModel.fromJson(String source) =>
      ListDealerModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListDealerModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListDealerModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
