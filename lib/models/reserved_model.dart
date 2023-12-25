// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class ReserveModel {
  String id;
  String groundId;
  String userId;
  String reservisionMakerId;
  String groundImage;
  bool iscomplete;
  bool isJoiner;
  List<dynamic> collaborations;
  int maxPlayersNum;
  String category;
  String time;
  String day;
  int targetplayesNum;
  bool isresrved;
  ReserveModel({
    required this.id,
    required this.groundId,
    required this.userId,
    required this.reservisionMakerId,
    required this.groundImage,
    required this.iscomplete,
    required this.isJoiner,
    required this.collaborations,
    required this.maxPlayersNum,
    required this.category,
    required this.time,
    required this.day,
    required this.targetplayesNum,
    required this.isresrved,
  });

  ReserveModel copyWith({
    String? id,
    String? groundId,
    String? userId,
    String? reservisionMakerId,
    String? groundImage,
    bool? iscomplete,
    bool? isJoiner,
    List<dynamic>? collaborations,
    int? maxPlayersNum,
    String? category,
    String? time,
    String? day,
    int? targetplayesNum,
    bool? isresrved,
  }) {
    return ReserveModel(
      id: id ?? this.id,
      groundId: groundId ?? this.groundId,
      userId: userId ?? this.userId,
      reservisionMakerId: reservisionMakerId ?? this.reservisionMakerId,
      groundImage: groundImage ?? this.groundImage,
      iscomplete: iscomplete ?? this.iscomplete,
      isJoiner: isJoiner ?? this.isJoiner,
      collaborations: collaborations ?? this.collaborations,
      maxPlayersNum: maxPlayersNum ?? this.maxPlayersNum,
      category: category ?? this.category,
      time: time ?? this.time,
      day: day ?? this.day,
      targetplayesNum: targetplayesNum ?? this.targetplayesNum,
      isresrved: isresrved ?? this.isresrved,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'groundId': groundId,
      'userId': userId,
      'reservisionMakerId': reservisionMakerId,
      'groundImage': groundImage,
      'iscomplete': iscomplete,
      'isJoiner': isJoiner,
      'collaborations': collaborations,
      'maxPlayersNum': maxPlayersNum,
      'category': category,
      'time': time,
      'day': day,
      'targetplayesNum': targetplayesNum,
      'isresrved': isresrved,
    };
  }

  factory ReserveModel.fromMap(Map<String, dynamic> map) {
    return ReserveModel(
      id: map['id'] as String,
      groundId: map['groundId'] as String,
      userId: map['userId'] as String,
      reservisionMakerId: map['reservisionMakerId'] as String,
      groundImage: map['groundImage'] as String,
      iscomplete: map['iscomplete'] as bool,
      isJoiner: map['isJoiner'] as bool,
      collaborations:
          List<dynamic>.from((map['collaborations'] as List<dynamic>)),
      maxPlayersNum: map['maxPlayersNum'] as int,
      category: map['category'] as String,
      time: map['time'] as String,
      day: map['day'] as String,
      targetplayesNum: map['targetplayesNum'] as int,
      isresrved: map['isresrved'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReserveModel.fromJson(String source) =>
      ReserveModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ReserveModel(id: $id, groundId: $groundId, userId: $userId, reservisionMakerId: $reservisionMakerId, groundImage: $groundImage, iscomplete: $iscomplete, isJoiner: $isJoiner, collaborations: $collaborations, maxPlayersNum: $maxPlayersNum, category: $category, time: $time, day: $day, targetplayesNum: $targetplayesNum, isresrved: $isresrved)';
  }

  @override
  bool operator ==(covariant ReserveModel other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.groundId == groundId &&
        other.userId == userId &&
        other.reservisionMakerId == reservisionMakerId &&
        other.groundImage == groundImage &&
        other.iscomplete == iscomplete &&
        other.isJoiner == isJoiner &&
        listEquals(other.collaborations, collaborations) &&
        other.maxPlayersNum == maxPlayersNum &&
        other.category == category &&
        other.time == time &&
        other.day == day &&
        other.targetplayesNum == targetplayesNum &&
        other.isresrved == isresrved;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        groundId.hashCode ^
        userId.hashCode ^
        reservisionMakerId.hashCode ^
        groundImage.hashCode ^
        iscomplete.hashCode ^
        isJoiner.hashCode ^
        collaborations.hashCode ^
        maxPlayersNum.hashCode ^
        category.hashCode ^
        time.hashCode ^
        day.hashCode ^
        targetplayesNum.hashCode ^
        isresrved.hashCode;
  }
}
