// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class CoacheModel {
  final String id;
  final String name;
  final String userId;
  final double raTing;
  final String photo;
  final String education;
  final String whatsAppNum;
  final String categoriry;
  final String experience;
  final int price;
  final String benefits;
  final List<dynamic> cvs;
  CoacheModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.raTing,
    required this.photo,
    required this.education,
    required this.whatsAppNum,
    required this.categoriry,
    required this.experience,
    required this.price,
    required this.benefits,
    required this.cvs,
  });

  CoacheModel copyWith({
    String? id,
    String? name,
    String? userId,
    double? raTing,
    String? photo,
    String? education,
    String? whatsAppNum,
    String? categoriry,
    String? experience,
    int? price,
    String? benefits,
    List<dynamic>? cvs,
  }) {
    return CoacheModel(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      raTing: raTing ?? this.raTing,
      photo: photo ?? this.photo,
      education: education ?? this.education,
      whatsAppNum: whatsAppNum ?? this.whatsAppNum,
      categoriry: categoriry ?? this.categoriry,
      experience: experience ?? this.experience,
      price: price ?? this.price,
      benefits: benefits ?? this.benefits,
      cvs: cvs ?? this.cvs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'userId': userId,
      'raTing': raTing,
      'photo': photo,
      'education': education,
      'whatsAppNum': whatsAppNum,
      'categoriry': categoriry,
      'experience': experience,
      'price': price,
      'benefits': benefits,
      'cvs': cvs,
    };
  }

  factory CoacheModel.fromMap(Map<String, dynamic> map) {
    return CoacheModel(
      id: map['id'] as String,
      name: map['name'] as String,
      userId: map['userId'] as String,
      raTing: map['raTing'] as double,
      photo: map['photo'] as String,
      education: map['education'] as String,
      whatsAppNum: map['whatsAppNum'] as String,
      categoriry: map['categoriry'] as String,
      experience: map['experience'] as String,
      price: map['price'] as int,
      benefits: map['benefits'] as String,
      cvs: List<dynamic>.from((map['cvs'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoacheModel.fromJson(String source) =>
      CoacheModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CoacheModel(id: $id, name: $name, userId: $userId, raTing: $raTing, photo: $photo, education: $education, whatsAppNum: $whatsAppNum, categoriry: $categoriry, experience: $experience, price: $price, benefits: $benefits, cvs: $cvs)';
  }

  @override
  bool operator ==(covariant CoacheModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.userId == userId &&
        other.raTing == raTing &&
        other.photo == photo &&
        other.education == education &&
        other.whatsAppNum == whatsAppNum &&
        other.categoriry == categoriry &&
        other.experience == experience &&
        other.price == price &&
        other.benefits == benefits &&
        listEquals(other.cvs, cvs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        userId.hashCode ^
        raTing.hashCode ^
        photo.hashCode ^
        education.hashCode ^
        whatsAppNum.hashCode ^
        categoriry.hashCode ^
        experience.hashCode ^
        price.hashCode ^
        benefits.hashCode ^
        cvs.hashCode;
  }
}
