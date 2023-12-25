// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NutritionModel {
  final String id;
  final String name;
  final String userId;
  final String specialization;
  final String image;
  final double raTing;
  final int price;
  final String education;
  final String experience;
  final String whatsAppNum;
  final String benefits;
  final int discount;
  NutritionModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.specialization,
    required this.image,
    required this.raTing,
    required this.price,
    required this.education,
    required this.experience,
    required this.whatsAppNum,
    required this.benefits,
    required this.discount,
  });

  NutritionModel copyWith({
    String? id,
    String? name,
    String? userId,
    String? specialization,
    String? image,
    double? raTing,
    int? price,
    String? education,
    String? experience,
    String? whatsAppNum,
    String? benefits,
    int? discount,
  }) {
    return NutritionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      specialization: specialization ?? this.specialization,
      image: image ?? this.image,
      raTing: raTing ?? this.raTing,
      price: price ?? this.price,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      whatsAppNum: whatsAppNum ?? this.whatsAppNum,
      benefits: benefits ?? this.benefits,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userId': userId,
      'specialization': specialization,
      'image': image,
      'raTing': raTing,
      'price': price,
      'education': education,
      'experience': experience,
      'whatsAppNum': whatsAppNum,
      'benefits': benefits,
      'discount': discount,
    };
  }

  factory NutritionModel.fromMap(Map<String, dynamic> map) {
    return NutritionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      userId: map['userId'] as String,
      specialization: map['specialization'] as String,
      image: map['image'] as String,
      raTing: map['raTing'] as double,
      price: map['price'] as int,
      education: map['education'] as String,
      experience: map['experience'] as String,
      whatsAppNum: map['whatsAppNum'] as String,
      benefits: map['benefits'] as String,
      discount: map['discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory NutritionModel.fromJson(String source) =>
      NutritionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NutritionModel(id: $id, name: $name, userId: $userId, specialization: $specialization, image: $image, raTing: $raTing, price: $price, education: $education, experience: $experience, whatsAppNum: $whatsAppNum, benefits: $benefits, discount: $discount)';
  }

  @override
  bool operator ==(covariant NutritionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.userId == userId &&
        other.specialization == specialization &&
        other.image == image &&
        other.raTing == raTing &&
        other.price == price &&
        other.education == education &&
        other.experience == experience &&
        other.whatsAppNum == whatsAppNum &&
        other.benefits == benefits &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userId.hashCode ^
        specialization.hashCode ^
        image.hashCode ^
        raTing.hashCode ^
        price.hashCode ^
        education.hashCode ^
        experience.hashCode ^
        whatsAppNum.hashCode ^
        benefits.hashCode ^
        discount.hashCode;
  }
}
