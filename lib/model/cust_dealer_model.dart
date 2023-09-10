import 'dart:convert';

class CustDealerModel {
  String? name;
  String? mobile;
  String? place;
  CustDealerModel({
    this.name,
    this.mobile,
    this.place,
  });

  CustDealerModel copyWith({
    String? name,
    String? mobile,
    String? place,
  }) {
    return CustDealerModel(
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      place: place ?? this.place,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'place': place,
    };
  }

  factory CustDealerModel.fromMap(Map<String, dynamic> map) {
    return CustDealerModel(
      name: map['name'],
      mobile: map['mobile'],
      place: map['place'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustDealerModel.fromJson(String source) =>
      CustDealerModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustDealerModel(name: $name, mobile: $mobile, place: $place)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustDealerModel &&
        other.name == name &&
        other.mobile == mobile &&
        other.place == place;
  }

  @override
  int get hashCode => name.hashCode ^ mobile.hashCode ^ place.hashCode;
}
