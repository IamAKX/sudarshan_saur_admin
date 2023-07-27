import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:saur_admin/model/table/dealer_for_table.dart';

class ListDealerForTable {
    List<DealerForTable>? data;
  ListDealerForTable({
    this.data,
  });


  ListDealerForTable copyWith({
    List<DealerForTable>? data,
  }) {
    return ListDealerForTable(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ListDealerForTable.fromMap(Map<String, dynamic> map) {
    return ListDealerForTable(
      data: map['data'] != null ? List<DealerForTable>.from(map['data']?.map((x) => DealerForTable.fromMap(x))) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListDealerForTable.fromJson(String source) => ListDealerForTable.fromMap(json.decode(source));

  @override
  String toString() => 'ListDealerForTable(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ListDealerForTable &&
      listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}
