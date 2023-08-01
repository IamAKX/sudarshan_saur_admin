import 'dart:convert';

class DashboardMetrics {
  int? customerCreated;
  int? customerActive;
  int? customerSuspended;
  int? customerBlocked;
  int? stockistCreated;
  int? stockistActive;
  int? stockistSuspended;
  int? stockistBlocked;
  int? dealerCreated;
  int? dealerActive;
  int? dealerSuspended;
  int? dealerBlocked;
  int? warrantyRequestPending;
  int? warrantyRequestApproved;
  int? warrantyRequestDeclined;
  DashboardMetrics({
    this.customerCreated,
    this.customerActive,
    this.customerSuspended,
    this.customerBlocked,
    this.stockistCreated,
    this.stockistActive,
    this.stockistSuspended,
    this.stockistBlocked,
    this.dealerCreated,
    this.dealerActive,
    this.dealerSuspended,
    this.dealerBlocked,
    this.warrantyRequestPending,
    this.warrantyRequestApproved,
    this.warrantyRequestDeclined,
  });

  DashboardMetrics copyWith({
    int? customerCreated,
    int? customerActive,
    int? customerSuspended,
    int? customerBlocked,
    int? stockistCreated,
    int? stockistActive,
    int? stockistSuspended,
    int? stockistBlocked,
    int? dealerCreated,
    int? dealerActive,
    int? dealerSuspended,
    int? dealerBlocked,
    int? warrantyRequestPending,
    int? warrantyRequestApproved,
    int? warrantyRequestDeclined,
  }) {
    return DashboardMetrics(
      customerCreated: customerCreated ?? this.customerCreated,
      customerActive: customerActive ?? this.customerActive,
      customerSuspended: customerSuspended ?? this.customerSuspended,
      customerBlocked: customerBlocked ?? this.customerBlocked,
      stockistCreated: stockistCreated ?? this.stockistCreated,
      stockistActive: stockistActive ?? this.stockistActive,
      stockistSuspended: stockistSuspended ?? this.stockistSuspended,
      stockistBlocked: stockistBlocked ?? this.stockistBlocked,
      dealerCreated: dealerCreated ?? this.dealerCreated,
      dealerActive: dealerActive ?? this.dealerActive,
      dealerSuspended: dealerSuspended ?? this.dealerSuspended,
      dealerBlocked: dealerBlocked ?? this.dealerBlocked,
      warrantyRequestPending: warrantyRequestPending ?? this.warrantyRequestPending,
      warrantyRequestApproved: warrantyRequestApproved ?? this.warrantyRequestApproved,
      warrantyRequestDeclined: warrantyRequestDeclined ?? this.warrantyRequestDeclined,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerCreated': customerCreated,
      'customerActive': customerActive,
      'customerSuspended': customerSuspended,
      'customerBlocked': customerBlocked,
      'stockistCreated': stockistCreated,
      'stockistActive': stockistActive,
      'stockistSuspended': stockistSuspended,
      'stockistBlocked': stockistBlocked,
      'dealerCreated': dealerCreated,
      'dealerActive': dealerActive,
      'dealerSuspended': dealerSuspended,
      'dealerBlocked': dealerBlocked,
      'warrantyRequestPending': warrantyRequestPending,
      'warrantyRequestApproved': warrantyRequestApproved,
      'warrantyRequestDeclined': warrantyRequestDeclined,
    };
  }

  factory DashboardMetrics.fromMap(Map<String, dynamic> map) {
    return DashboardMetrics(
      customerCreated: map['customerCreated']?.toInt(),
      customerActive: map['customerActive']?.toInt(),
      customerSuspended: map['customerSuspended']?.toInt(),
      customerBlocked: map['customerBlocked']?.toInt(),
      stockistCreated: map['stockistCreated']?.toInt(),
      stockistActive: map['stockistActive']?.toInt(),
      stockistSuspended: map['stockistSuspended']?.toInt(),
      stockistBlocked: map['stockistBlocked']?.toInt(),
      dealerCreated: map['dealerCreated']?.toInt(),
      dealerActive: map['dealerActive']?.toInt(),
      dealerSuspended: map['dealerSuspended']?.toInt(),
      dealerBlocked: map['dealerBlocked']?.toInt(),
      warrantyRequestPending: map['warrantyRequestPending']?.toInt(),
      warrantyRequestApproved: map['warrantyRequestApproved']?.toInt(),
      warrantyRequestDeclined: map['warrantyRequestDeclined']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory DashboardMetrics.fromJson(String source) => DashboardMetrics.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DashboardMetrics(customerCreated: $customerCreated, customerActive: $customerActive, customerSuspended: $customerSuspended, customerBlocked: $customerBlocked, stockistCreated: $stockistCreated, stockistActive: $stockistActive, stockistSuspended: $stockistSuspended, stockistBlocked: $stockistBlocked, dealerCreated: $dealerCreated, dealerActive: $dealerActive, dealerSuspended: $dealerSuspended, dealerBlocked: $dealerBlocked, warrantyRequestPending: $warrantyRequestPending, warrantyRequestApproved: $warrantyRequestApproved, warrantyRequestDeclined: $warrantyRequestDeclined)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is DashboardMetrics &&
      other.customerCreated == customerCreated &&
      other.customerActive == customerActive &&
      other.customerSuspended == customerSuspended &&
      other.customerBlocked == customerBlocked &&
      other.stockistCreated == stockistCreated &&
      other.stockistActive == stockistActive &&
      other.stockistSuspended == stockistSuspended &&
      other.stockistBlocked == stockistBlocked &&
      other.dealerCreated == dealerCreated &&
      other.dealerActive == dealerActive &&
      other.dealerSuspended == dealerSuspended &&
      other.dealerBlocked == dealerBlocked &&
      other.warrantyRequestPending == warrantyRequestPending &&
      other.warrantyRequestApproved == warrantyRequestApproved &&
      other.warrantyRequestDeclined == warrantyRequestDeclined;
  }

  @override
  int get hashCode {
    return customerCreated.hashCode ^
      customerActive.hashCode ^
      customerSuspended.hashCode ^
      customerBlocked.hashCode ^
      stockistCreated.hashCode ^
      stockistActive.hashCode ^
      stockistSuspended.hashCode ^
      stockistBlocked.hashCode ^
      dealerCreated.hashCode ^
      dealerActive.hashCode ^
      dealerSuspended.hashCode ^
      dealerBlocked.hashCode ^
      warrantyRequestPending.hashCode ^
      warrantyRequestApproved.hashCode ^
      warrantyRequestDeclined.hashCode;
  }
}
