import 'dart:convert';

class WarrantyCount {
  String? approved;
  String? denied;
  String? pendingImageUploaded;
  String? pendingImageNotUploaded;
  WarrantyCount({
    this.approved,
    this.denied,
    this.pendingImageUploaded,
    this.pendingImageNotUploaded,
  });

  WarrantyCount copyWith({
    String? approved,
    String? denied,
    String? pendingImageUploaded,
    String? pendingImageNotUploaded,
  }) {
    return WarrantyCount(
      approved: approved ?? this.approved,
      denied: denied ?? this.denied,
      pendingImageUploaded: pendingImageUploaded ?? this.pendingImageUploaded,
      pendingImageNotUploaded: pendingImageNotUploaded ?? this.pendingImageNotUploaded,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(approved != null){
      result.addAll({'approved': approved});
    }
    if(denied != null){
      result.addAll({'denied': denied});
    }
    if(pendingImageUploaded != null){
      result.addAll({'pendingImageUploaded': pendingImageUploaded});
    }
    if(pendingImageNotUploaded != null){
      result.addAll({'pendingImageNotUploaded': pendingImageNotUploaded});
    }
  
    return result;
  }

  factory WarrantyCount.fromMap(Map<String, dynamic> map) {
    return WarrantyCount(
      approved: map['approved'],
      denied: map['denied'],
      pendingImageUploaded: map['pendingImageUploaded'],
      pendingImageNotUploaded: map['pendingImageNotUploaded'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WarrantyCount.fromJson(String source) => WarrantyCount.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WarrantyCount(approved: $approved, denied: $denied, pendingImageUploaded: $pendingImageUploaded, pendingImageNotUploaded: $pendingImageNotUploaded)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is WarrantyCount &&
      other.approved == approved &&
      other.denied == denied &&
      other.pendingImageUploaded == pendingImageUploaded &&
      other.pendingImageNotUploaded == pendingImageNotUploaded;
  }

  @override
  int get hashCode {
    return approved.hashCode ^
      denied.hashCode ^
      pendingImageUploaded.hashCode ^
      pendingImageNotUploaded.hashCode;
  }
}
