// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SportsModel {
  final String id;
  final String name;
  final String image;
  final int discount;
  final double rating;
  final String about;
  final String storelink;
  SportsModel({
    required this.id,
    required this.name,
    required this.image,
    required this.discount,
    required this.rating,
    required this.about,
    required this.storelink,
  });

  SportsModel copyWith({
    String? id,
    String? name,
    String? image,
    int? discount,
    double? rating,
    String? about,
    String? storelink,
  }) {
    return SportsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      about: about ?? this.about,
      storelink: storelink ?? this.storelink,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
      'discount': discount,
      'rating': rating,
      'about': about,
      'storelink': storelink,
    };
  }

  factory SportsModel.fromMap(Map<String, dynamic> map) {
    return SportsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      discount: map['discount'] as int,
      rating: map['rating'] as double,
      about: map['about'] as String,
      storelink: map['storelink'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SportsModel.fromJson(String source) =>
      SportsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SportsModel(id: $id, name: $name, image: $image, discount: $discount, rating: $rating, about: $about, storelink: $storelink)';
  }

  @override
  bool operator ==(covariant SportsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.image == image &&
        other.discount == discount &&
        other.rating == rating &&
        other.about == about &&
        other.storelink == storelink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        discount.hashCode ^
        rating.hashCode ^
        about.hashCode ^
        storelink.hashCode;
  }
}
