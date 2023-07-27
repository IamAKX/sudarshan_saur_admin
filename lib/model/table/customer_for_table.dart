import 'dart:convert';

class CustomerForTable {
  int? customerId;
  String? customerName;
  String? email;
  String? mobileNo;
  String? createdOn;
  String? status;
  String? view;
  bool? isActive;
  CustomerForTable({
    this.customerId,
    this.customerName,
    this.email,
    this.mobileNo,
    this.createdOn,
    this.status,
    this.view,
    this.isActive,
  });

  CustomerForTable copyWith({
    int? customerId,
    String? customerName,
    String? email,
    String? mobileNo,
    String? createdOn,
    String? status,
    String? view,
    bool? isActive,
  }) {
    return CustomerForTable(
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      mobileNo: mobileNo ?? this.mobileNo,
      createdOn: createdOn ?? this.createdOn,
      status: status ?? this.status,
      view: view ?? this.view,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'customerName': customerName,
      'email': email,
      'mobileNo': mobileNo,
      'createdOn': createdOn,
      'status': status,
      'view': view,
      'isActive': isActive,
    };
  }

  factory CustomerForTable.fromMap(Map<String, dynamic> map) {
    return CustomerForTable(
      customerId: map['customerId']?.toInt(),
      customerName: map['customerName'],
      email: map['email'],
      mobileNo: map['mobileNo'],
      createdOn: map['createdOn'],
      status: map['status'],
      view: map['view'],
      isActive: map['isActive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerForTable.fromJson(String source) =>
      CustomerForTable.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerForTable(customerId: $customerId, customerName: $customerName, email: $email, mobileNo: $mobileNo, createdOn: $createdOn, status: $status, view: $view, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerForTable &&
        other.customerId == customerId &&
        other.customerName == customerName &&
        other.email == email &&
        other.mobileNo == mobileNo &&
        other.createdOn == createdOn &&
        other.status == status &&
        other.view == view &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return customerId.hashCode ^
        customerName.hashCode ^
        email.hashCode ^
        mobileNo.hashCode ^
        createdOn.hashCode ^
        status.hashCode ^
        view.hashCode ^
        isActive.hashCode;
  }
}
