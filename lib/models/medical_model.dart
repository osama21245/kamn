// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class MedicalModel {
  final String id;
  final String userId;
  final String name;
  final double raTing;
  final String image;
  final String education;
  final int price;
  final String specialization;
  final String experience;
  final String benefits;
  final String whatAppNum;
  final int discount;
  MedicalModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.raTing,
    required this.image,
    required this.education,
    required this.price,
    required this.specialization,
    required this.experience,
    required this.benefits,
    required this.whatAppNum,
    required this.discount,
  });

  MedicalModel copyWith({
    String? id,
    String? userId,
    String? name,
    double? raTing,
    String? image,
    String? education,
    int? price,
    String? specialization,
    String? experience,
    String? benefits,
    String? whatAppNum,
    int? discount,
  }) {
    return MedicalModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      raTing: raTing ?? this.raTing,
      image: image ?? this.image,
      education: education ?? this.education,
      price: price ?? this.price,
      specialization: specialization ?? this.specialization,
      experience: experience ?? this.experience,
      benefits: benefits ?? this.benefits,
      whatAppNum: whatAppNum ?? this.whatAppNum,
      discount: discount ?? this.discount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'raTing': raTing,
      'image': image,
      'education': education,
      'price': price,
      'specialization': specialization,
      'experience': experience,
      'benefits': benefits,
      'whatAppNum': whatAppNum,
      'discount': discount,
    };
  }

  factory MedicalModel.fromMap(Map<String, dynamic> map) {
    return MedicalModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      name: map['name'] as String,
      raTing: map['raTing'] as double,
      image: map['image'] as String,
      education: map['education'] as String,
      price: map['price'] as int,
      specialization: map['specialization'] as String,
      experience: map['experience'] as String,
      benefits: map['benefits'] as String,
      whatAppNum: map['whatAppNum'] as String,
      discount: map['discount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MedicalModel.fromJson(String source) =>
      MedicalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MedicalModel(id: $id, userId: $userId, name: $name, raTing: $raTing, image: $image, education: $education, price: $price, specialization: $specialization, experience: $experience, benefits: $benefits, whatAppNum: $whatAppNum, discount: $discount)';
  }

  @override
  bool operator ==(covariant MedicalModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.raTing == raTing &&
        other.image == image &&
        other.education == education &&
        other.price == price &&
        other.specialization == specialization &&
        other.experience == experience &&
        other.benefits == benefits &&
        other.whatAppNum == whatAppNum &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        raTing.hashCode ^
        image.hashCode ^
        education.hashCode ^
        price.hashCode ^
        specialization.hashCode ^
        experience.hashCode ^
        benefits.hashCode ^
        whatAppNum.hashCode ^
        discount.hashCode;
  }
}
