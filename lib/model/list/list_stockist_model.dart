import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/stockist_model.dart';

class ListStockistModel {
  List<StockistModel>? data;
  ListStockistModel({
    this.data,
  });

  ListStockistModel copyWith({
    List<StockistModel>? data,
  }) {
    return ListStockistModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ListStockistModel.fromMap(Map<String, dynamic> map) {
    return ListStockistModel(
      data: map['data'] != null
          ? List<StockistModel>.from(
              map['data']?.map((x) => StockistModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListStockistModel.fromJson(String source) =>
      ListStockistModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListStockistModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListStockistModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
