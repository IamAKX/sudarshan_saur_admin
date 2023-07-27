import 'dart:convert';

class DealerForTable {
  int? dealerId;
  String? dealerName;
  String? businessName;
  String? mobileNo;
  String? createdOn;
  String? status;
  String? view;
  String? isActive;
  DealerForTable({
    this.dealerId,
    this.dealerName,
    this.businessName,
    this.mobileNo,
    this.createdOn,
    this.status,
    this.view,
    this.isActive,
  });

  DealerForTable copyWith({
    int? dealerId,
    String? dealerName,
    String? businessName,
    String? mobileNo,
    String? createdOn,
    String? status,
    String? view,
    String? isActive,
  }) {
    return DealerForTable(
      dealerId: dealerId ?? this.dealerId,
      dealerName: dealerName ?? this.dealerName,
      businessName: businessName ?? this.businessName,
      mobileNo: mobileNo ?? this.mobileNo,
      createdOn: createdOn ?? this.createdOn,
      status: status ?? this.status,
      view: view ?? this.view,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dealerId': dealerId,
      'dealerName': dealerName,
      'businessName': businessName,
      'mobileNo': mobileNo,
      'createdOn': createdOn,
      'status': status,
      'view': view,
      'isActive': isActive,
    };
  }

  factory DealerForTable.fromMap(Map<String, dynamic> map) {
    return DealerForTable(
      dealerId: map['dealerId']?.toInt(),
      dealerName: map['dealerName'],
      businessName: map['businessName'],
      mobileNo: map['mobileNo'],
      createdOn: map['createdOn'],
      status: map['status'],
      view: map['view'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DealerForTable.fromJson(String source) => DealerForTable.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DealerForTable(dealerId: $dealerId, dealerName: $dealerName, businessName: $businessName, mobileNo: $mobileNo, createdOn: $createdOn, status: $status, view: $view, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DealerForTable &&
      other.dealerId == dealerId &&
      other.dealerName == dealerName &&
      other.businessName == businessName &&
      other.mobileNo == mobileNo &&
      other.createdOn == createdOn &&
      other.status == status &&
      other.view == view &&
      other.isActive == isActive;
  }

  @override
  int get hashCode {
    return dealerId.hashCode ^
      dealerName.hashCode ^
      businessName.hashCode ^
      mobileNo.hashCode ^
      createdOn.hashCode ^
      status.hashCode ^
      view.hashCode ^
      isActive.hashCode;
  }
}
