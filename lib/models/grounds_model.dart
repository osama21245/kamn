// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GroundModel {
  final String id;
  final String name;
  final String address;
  final String groundImage;
  final String groundOwnerId;
  final int price;
  final int rating;
  final String groundnumber;
  final int groundPlayersNum;
  final String ownerNum;
  final String futuers;
  final double long;
  final double lat;
  GroundModel({
    required this.id,
    required this.name,
    required this.address,
    required this.groundImage,
    required this.groundOwnerId,
    required this.price,
    required this.rating,
    required this.groundnumber,
    required this.groundPlayersNum,
    required this.ownerNum,
    required this.futuers,
    required this.long,
    required this.lat,
  });

  GroundModel copyWith({
    String? id,
    String? name,
    String? address,
    String? groundImage,
    String? groundOwnerId,
    int? price,
    int? rating,
    String? groundnumber,
    int? groundPlayersNum,
    String? ownerNum,
    String? futuers,
    double? long,
    double? lat,
  }) {
    return GroundModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      groundImage: groundImage ?? this.groundImage,
      groundOwnerId: groundOwnerId ?? this.groundOwnerId,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      groundnumber: groundnumber ?? this.groundnumber,
      groundPlayersNum: groundPlayersNum ?? this.groundPlayersNum,
      ownerNum: ownerNum ?? this.ownerNum,
      futuers: futuers ?? this.futuers,
      long: long ?? this.long,
      lat: lat ?? this.lat,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'groundImage': groundImage,
      'groundOwnerId': groundOwnerId,
      'price': price,
      'rating': rating,
      'groundnumber': groundnumber,
      'groundPlayersNum': groundPlayersNum,
      'ownerNum': ownerNum,
      'futuers': futuers,
      'long': long,
      'lat': lat,
    };
  }

  factory GroundModel.fromMap(Map<String, dynamic> map) {
    return GroundModel(
      id: map['id'] as String,
      name: map['name'] as String,
      address: map['address'] as String,
      groundImage: map['groundImage'] as String,
      groundOwnerId: map['groundOwnerId'] as String,
      price: map['price'] as int,
      rating: map['rating'] as int,
      groundnumber: map['groundnumber'] as String,
      groundPlayersNum: map['groundPlayersNum'] as int,
      ownerNum: map['ownerNum'] as String,
      futuers: map['futuers'] as String,
      long: map['long'] as double,
      lat: map['lat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroundModel.fromJson(String source) =>
      GroundModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroundModel(id: $id, name: $name, address: $address, groundImage: $groundImage, groundOwnerId: $groundOwnerId, price: $price, rating: $rating, groundnumber: $groundnumber, groundPlayersNum: $groundPlayersNum, ownerNum: $ownerNum, futuers: $futuers, long: $long, lat: $lat)';
  }

  @override
  bool operator ==(covariant GroundModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.groundImage == groundImage &&
        other.groundOwnerId == groundOwnerId &&
        other.price == price &&
        other.rating == rating &&
        other.groundnumber == groundnumber &&
        other.groundPlayersNum == groundPlayersNum &&
        other.ownerNum == ownerNum &&
        other.futuers == futuers &&
        other.long == long &&
        other.lat == lat;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        address.hashCode ^
        groundImage.hashCode ^
        groundOwnerId.hashCode ^
        price.hashCode ^
        rating.hashCode ^
        groundnumber.hashCode ^
        groundPlayersNum.hashCode ^
        ownerNum.hashCode ^
        futuers.hashCode ^
        long.hashCode ^
        lat.hashCode;
  }
}
