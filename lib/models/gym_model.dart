// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GymModel {
  final String id;
  final String name;
  final String owneruserId;
  final String benefitsFirstPlan;
  final String benefitsSecoundPlan;
  final String link;
  final String logo;
  final String address;
  final double rating;
  final double long;
  final double lat;
  final bool ismix;
  final int price;
  GymModel({
    required this.id,
    required this.name,
    required this.owneruserId,
    required this.benefitsFirstPlan,
    required this.benefitsSecoundPlan,
    required this.link,
    required this.logo,
    required this.address,
    required this.rating,
    required this.long,
    required this.lat,
    required this.ismix,
    required this.price,
  });

  GymModel copyWith({
    String? id,
    String? name,
    String? owneruserId,
    String? benefitsFirstPlan,
    String? benefitsSecoundPlan,
    String? link,
    String? logo,
    String? address,
    double? rating,
    double? long,
    double? lat,
    bool? ismix,
    int? price,
  }) {
    return GymModel(
      id: id ?? this.id,
      name: name ?? this.name,
      owneruserId: owneruserId ?? this.owneruserId,
      benefitsFirstPlan: benefitsFirstPlan ?? this.benefitsFirstPlan,
      benefitsSecoundPlan: benefitsSecoundPlan ?? this.benefitsSecoundPlan,
      link: link ?? this.link,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      long: long ?? this.long,
      lat: lat ?? this.lat,
      ismix: ismix ?? this.ismix,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'owneruserId': owneruserId,
      'benefitsFirstPlan': benefitsFirstPlan,
      'benefitsSecoundPlan': benefitsSecoundPlan,
      'link': link,
      'logo': logo,
      'address': address,
      'rating': rating,
      'long': long,
      'lat': lat,
      'ismix': ismix,
      'price': price,
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      id: map['id'] as String,
      name: map['name'] as String,
      owneruserId: map['owneruserId'] as String,
      benefitsFirstPlan: map['benefitsFirstPlan'] as String,
      benefitsSecoundPlan: map['benefitsSecoundPlan'] as String,
      link: map['link'] as String,
      logo: map['logo'] as String,
      address: map['address'] as String,
      rating: map['rating'] as double,
      long: map['long'] as double,
      lat: map['lat'] as double,
      ismix: map['ismix'] as bool,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) =>
      GymModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymModel(id: $id, name: $name, owneruserId: $owneruserId, benefitsFirstPlan: $benefitsFirstPlan, benefitsSecoundPlan: $benefitsSecoundPlan, link: $link, logo: $logo, address: $address, rating: $rating, long: $long, lat: $lat, ismix: $ismix, price: $price)';
  }

  @override
  bool operator ==(covariant GymModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.owneruserId == owneruserId &&
        other.benefitsFirstPlan == benefitsFirstPlan &&
        other.benefitsSecoundPlan == benefitsSecoundPlan &&
        other.link == link &&
        other.logo == logo &&
        other.address == address &&
        other.rating == rating &&
        other.long == long &&
        other.lat == lat &&
        other.ismix == ismix &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        owneruserId.hashCode ^
        benefitsFirstPlan.hashCode ^
        benefitsSecoundPlan.hashCode ^
        link.hashCode ^
        logo.hashCode ^
        address.hashCode ^
        rating.hashCode ^
        long.hashCode ^
        lat.hashCode ^
        ismix.hashCode ^
        price.hashCode;
  }
}
