// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePic;
  final String uid;
  final String phone;
  final bool isAuthanticated;
  final int points;
  final bool isonline;
  final bool isactive;
  final List<dynamic> followers;
  final List<dynamic> ingroup;
  final List<dynamic> awards;
  final String gender;
  final String country;
  final String age;
  final String city;
  final String state;
  final List<dynamic> myGrounds;
  UserModel({
    required this.name,
    required this.profilePic,
    required this.uid,
    required this.phone,
    required this.isAuthanticated,
    required this.points,
    required this.isonline,
    required this.isactive,
    required this.followers,
    required this.ingroup,
    required this.awards,
    required this.gender,
    required this.country,
    required this.age,
    required this.city,
    required this.state,
    required this.myGrounds,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    String? uid,
    String? phone,
    bool? isAuthanticated,
    int? points,
    bool? isonline,
    bool? isactive,
    List<dynamic>? followers,
    List<dynamic>? ingroup,
    List<dynamic>? awards,
    String? gender,
    String? country,
    String? age,
    String? city,
    String? state,
    List<String>? myGrounds,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      isAuthanticated: isAuthanticated ?? this.isAuthanticated,
      points: points ?? this.points,
      isonline: isonline ?? this.isonline,
      isactive: isactive ?? this.isactive,
      followers: followers ?? this.followers,
      ingroup: ingroup ?? this.ingroup,
      awards: awards ?? this.awards,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      age: age ?? this.age,
      city: city ?? this.city,
      state: state ?? this.state,
      myGrounds: myGrounds ?? this.myGrounds,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'uid': uid,
      'phone': phone,
      'isAuthanticated': isAuthanticated,
      'points': points,
      'isonline': isonline,
      'isactive': isactive,
      'followers': followers,
      'ingroup': ingroup,
      'awards': awards,
      'gender': gender,
      'country': country,
      'age': age,
      'city': city,
      'state': state,
      'myGrounds': myGrounds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['uid'] as String,
      phone: map['phone'] as String,
      isAuthanticated: map['isAuthanticated'] as bool,
      points: map['points'] as int,
      isonline: map['isonline'] as bool,
      isactive: map['isactive'] as bool,
      followers: List<dynamic>.from((map['followers'] as List<dynamic>)),
      ingroup: List<dynamic>.from((map['ingroup'] as List<dynamic>)),
      awards: List<dynamic>.from((map['awards'] as List<dynamic>)),
      gender: map['gender'] as String,
      country: map['country'] as String,
      age: map['age'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      myGrounds: List<dynamic>.from((map['myGrounds'] as List<dynamic>)),
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, uid: $uid, phone: $phone, isAuthanticated: $isAuthanticated, points: $points, isonline: $isonline, isactive: $isactive, followers: $followers, ingroup: $ingroup, awards: $awards, gender: $gender, country: $country, age: $age, city: $city, state: $state, myGrounds: $myGrounds)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        other.phone == phone &&
        other.isAuthanticated == isAuthanticated &&
        other.points == points &&
        other.isonline == isonline &&
        other.isactive == isactive &&
        listEquals(other.followers, followers) &&
        listEquals(other.ingroup, ingroup) &&
        listEquals(other.awards, awards) &&
        other.gender == gender &&
        other.country == country &&
        other.age == age &&
        other.city == city &&
        other.state == state &&
        listEquals(other.myGrounds, myGrounds);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        phone.hashCode ^
        isAuthanticated.hashCode ^
        points.hashCode ^
        isonline.hashCode ^
        isactive.hashCode ^
        followers.hashCode ^
        ingroup.hashCode ^
        awards.hashCode ^
        gender.hashCode ^
        country.hashCode ^
        age.hashCode ^
        city.hashCode ^
        state.hashCode ^
        myGrounds.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
