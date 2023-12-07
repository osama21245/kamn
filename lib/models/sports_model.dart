// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SportsModel {
  final String id;
  final String name;
  final int discount;
  final String about;
  final String storelink;
  SportsModel({
    required this.id,
    required this.name,
    required this.discount,
    required this.about,
    required this.storelink,
  });

  SportsModel copyWith({
    String? id,
    String? name,
    int? discount,
    String? about,
    String? storelink,
  }) {
    return SportsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      discount: discount ?? this.discount,
      about: about ?? this.about,
      storelink: storelink ?? this.storelink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'discount': discount,
      'about': about,
      'storelink': storelink,
    };
  }

  factory SportsModel.fromMap(Map<String, dynamic> map) {
    return SportsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      discount: map['discount'] as int,
      about: map['about'] as String,
      storelink: map['storelink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportsModel.fromJson(String source) =>
      SportsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SportsModel(id: $id, name: $name, discount: $discount, about: $about, storelink: $storelink)';
  }

  @override
  bool operator ==(covariant SportsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.discount == discount &&
        other.about == about &&
        other.storelink == storelink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        discount.hashCode ^
        about.hashCode ^
        storelink.hashCode;
  }
}
