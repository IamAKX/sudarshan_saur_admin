import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/sdw_model.dart';

class ListSdwModel {
  List<SdwModel>? data;
  ListSdwModel({
    this.data,
  });

  ListSdwModel copyWith({
    List<SdwModel>? data,
  }) {
    return ListSdwModel(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (data != null) {
      result.addAll({'data': data!.map((x) => x?.toMap()).toList()});
    }

    return result;
  }

  factory ListSdwModel.fromMap(Map<String, dynamic> map) {
    return ListSdwModel(
      data: map['data'] != null
          ? List<SdwModel>.from(map['data']?.map((x) => SdwModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListSdwModel.fromJson(String source) =>
      ListSdwModel.fromMap(json.decode(source));

  @override
  String toString() => 'ListSdwModel(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListSdwModel && listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
