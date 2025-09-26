// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GymModel {
  final String? id;
  final String? name;
  final String? uniqueName;
  final String? address;
  final List<String>? imagesUrl;
  final String? logoUrl;
  final String? description;
  final String? phoneNumber;
  final List<double>? ratings;
  final List<String>? reviews;
  final List<Plan>? offers;
  final List<ScoialMediaLink>? scoialMediaLinks;
  final List<Feature>? features;
  final List<OpenDuration>? openDuration;
  final bool? isFullTimeAccess;
  final String? serviceProviderId;
  GymModel({
    this.id,
    this.name,
    this.uniqueName,
    this.address,
    this.imagesUrl,
    this.logoUrl,
    this.description,
    this.phoneNumber,
    this.ratings,
    this.reviews,
    this.offers,
    this.scoialMediaLinks,
    this.features,
    this.openDuration,
    this.isFullTimeAccess,
    this.serviceProviderId,
  });

  GymModel copyWith({
    String? id,
    String? name,
    String? uniqueName,
    String? address,
    List<String>? imagesUrl,
    String? logoUrl,
    String? description,
    String? phoneNumber,
    List<double>? ratings,
    List<String>? reviews,
    List<Plan>? offers,
    List<ScoialMediaLink>? scoialMediaLinks,
    List<Feature>? features,
    List<OpenDuration>? openDuration,
    bool? isFullTimeAccess,
    String? serviceProviderId,
  }) {
    return GymModel(
      id: id ?? this.id,
      name: name ?? this.name,
      uniqueName: uniqueName ?? this.uniqueName,
      address: address ?? this.address,
      imagesUrl: imagesUrl ?? this.imagesUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      ratings: ratings ?? this.ratings,
      reviews: reviews ?? this.reviews,
      offers: offers ?? this.offers,
      scoialMediaLinks: scoialMediaLinks ?? this.scoialMediaLinks,
      features: features ?? this.features,
      openDuration: openDuration ?? this.openDuration,
      isFullTimeAccess: isFullTimeAccess ?? this.isFullTimeAccess,
      serviceProviderId: serviceProviderId ?? this.serviceProviderId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'uniqueName': uniqueName,
      'address': address,
      'imagesUrl': imagesUrl,
      'logoUrl': logoUrl,
      'description': description,
      'phoneNumber': phoneNumber,
      'ratings': ratings,
      'reviews': reviews,
      'offers': offers?.map((x) => x.toMap()).toList(),
      'scoialMediaLinks': scoialMediaLinks?.map((x) => x.toMap()).toList(),
      'features': features?.map((x) => x.toMap()).toList(),
      'openDuration': openDuration?.map((x) => x.toMap()).toList(),
      'isFullTimeAccess': isFullTimeAccess,
      'serviceProviderId': serviceProviderId,
    };
  }

  factory GymModel.fromMap(Map<String, dynamic> map) {
    return GymModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      uniqueName:
          map['uniqueName'] != null ? map['uniqueName'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      imagesUrl: map['imagesUrl'] != null
          ? List<String>.from((map['imagesUrl'] as List<dynamic>))
          : null,
      logoUrl: map['logoUrl'] != null ? map['logoUrl'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      ratings: map['ratings'] != null
          ? List<double>.from((map['ratings'] as List<double>))
          : null,
      reviews: map['reviews'] != null
          ? List<String>.from((map['reviews'] as List<dynamic>))
          : null,
      offers: map['offers'] != null
          ? List<Plan>.from(
              (map['offers'] as List<Plan>).map<Plan?>(
                (x) => Plan.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      scoialMediaLinks: map['scoialMediaLinks'] != null
          ? List<ScoialMediaLink>.from(
              (map['scoialMediaLinks'] as List<dynamic>).map<ScoialMediaLink?>(
                (x) => ScoialMediaLink.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      features: map['features'] != null
          ? List<Feature>.from(
              (map['features'] as List<int>).map<Feature?>(
                (x) => Feature.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      openDuration: map['openDuration'] != null
          ? List<OpenDuration>.from(
              (map['openDuration'] as List<int>).map<OpenDuration?>(
                (x) => OpenDuration.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      isFullTimeAccess: map['isFullTimeAccess'] != null
          ? map['isFullTimeAccess'] as bool
          : null,
      serviceProviderId: map['serviceProviderId'] != null ? map['serviceProviderId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GymModel.fromJson(String source) =>
      GymModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GymModel(id: $id, name: $name, uniqueName: $uniqueName, address: $address, imageUrl: $imagesUrl, logoUrl: $logoUrl, description: $description, phoneNumber: $phoneNumber, ratings: $ratings, reviews: $reviews, offers: $offers, scoialMediaLinks: $scoialMediaLinks, features: $features, openDuration: $openDuration, isFullTimeAccess: $isFullTimeAccess, userId: $serviceProviderId)';
  }

  @override
  bool operator ==(covariant GymModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.uniqueName == uniqueName &&
        other.address == address &&
        listEquals(other.imagesUrl, imagesUrl) &&
        other.logoUrl == logoUrl &&
        other.description == description &&
        other.phoneNumber == phoneNumber &&
        listEquals(other.ratings, ratings) &&
        listEquals(other.reviews, reviews) &&
        listEquals(other.offers, offers) &&
        listEquals(other.scoialMediaLinks, scoialMediaLinks) &&
        listEquals(other.features, features) &&
        listEquals(other.openDuration, openDuration) &&
        other.isFullTimeAccess == isFullTimeAccess &&
        other.serviceProviderId == serviceProviderId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        uniqueName.hashCode ^
        address.hashCode ^
        imagesUrl.hashCode ^
        logoUrl.hashCode ^
        description.hashCode ^
        phoneNumber.hashCode ^
        ratings.hashCode ^
        reviews.hashCode ^
        offers.hashCode ^
        scoialMediaLinks.hashCode ^
        features.hashCode ^
        openDuration.hashCode ^
        isFullTimeAccess.hashCode ^
        serviceProviderId.hashCode;
  }
}

class Plan {
  final String? planName;
  final String? price;
  final String? freeMonths;
  final bool? isDiscount;
  final String? discountPercentage;
  final String? priceAfterDiscount;
  final DateTime? discountStartDate;
  final DateTime? discountEndDate;
  final String? planId; // Added planId
  final PlanDuration? planDuration;
  final bool? is247Days;
  final bool? is24Hours;
  final List<IntervalSelected>? intervals;
  final String? notes;
  final List<Feature>? features;
  Plan({
    required this.planName,
    this.price,
    this.freeMonths,
    required this.isDiscount,
    this.discountPercentage,
    this.priceAfterDiscount,
    this.discountStartDate,
    this.discountEndDate,
    this.planId, // Added to constructor
    this.planDuration,
    required this.is247Days,
    required this.is24Hours,
    this.intervals,
    this.notes,
    required this.features,
  });

  Plan copyWith({
    String? planName,
    String? price,
    String? freeMonths,
    bool? isDiscount,
    String? discountPercentage,
    String? priceAfterDiscount,
    DateTime? discountStartDate,
    DateTime? discountEndDate,
    String? planId, // Added to copyWith
    PlanDuration? planDuration,
    bool? is247Days,
    bool? is24Hours,
    List<IntervalSelected>? intervals,
    String? notes,
    List<Feature>? features,
  }) {
    return Plan(
      planName: planName ?? this.planName,
      price: price ?? this.price,
      freeMonths: freeMonths ?? this.freeMonths,
      isDiscount: isDiscount ?? this.isDiscount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      priceAfterDiscount: priceAfterDiscount ?? this.priceAfterDiscount,
      discountStartDate: discountStartDate ?? this.discountStartDate,
      discountEndDate: discountEndDate ?? this.discountEndDate,
      planId: planId ?? this.planId, // Added to copyWith return
      planDuration: planDuration ?? this.planDuration,
      is247Days: is247Days ?? this.is247Days,
      is24Hours: is24Hours ?? this.is24Hours,
      intervals: intervals ?? this.intervals,
      notes: notes ?? this.notes,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'planName': planName,
      'price': price,
      'freeMonths': freeMonths,
      'isDiscount': isDiscount,
      'discountPercentage': discountPercentage,
      'priceAfterDiscount': priceAfterDiscount,
      'discountStartDate': discountStartDate?.millisecondsSinceEpoch,
      'discountEndDate': discountEndDate?.millisecondsSinceEpoch,
      'planId': planId, // Added to toMap
      'planDuration': planDuration?.displayName,
      'is247Days': is247Days,
      'is24Hours': is24Hours,
      'intervals': intervals?.map((x) => x.toMap()).toList(),
      'notes': notes,
      'features': features?.map((x) => x.toMap()).toList(),
    };
  }

factory Plan.fromMap(Map<String, dynamic> map) {
    return Plan(
      planName: map['planName']?.toString()?? '',
      price: map['price']?.toString()?? '',
      freeMonths: map['freeMonths'] ?.toString() ?? '',
      isDiscount: map['isDiscount'] as bool? ?? false,
      discountPercentage: map['discountPercentage']?.toString() ?? '',
      priceAfterDiscount: map['priceAfterDiscount']?.toString() ?? '',
      discountStartDate: map['discountStartDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['discountStartDate'] as int)
          : null,
      discountEndDate: map['discountEndDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['discountEndDate'] as int)
          : null,
      planId: map['planId'] as String? ?? '',
      planDuration: map['planDuration'] != null
          ? PlanDuration.values.firstWhere(
              (duration) => duration.displayName == map['planDuration'],
              orElse: () => PlanDuration.monthly,
            )
          : null,
      is247Days: map['is247Days'] as bool? ?? false,
      is24Hours: map['is24Hours'] as bool? ?? false,
      intervals: map['intervals'] != null
          ? List<IntervalSelected>.from(
              (map['intervals'] as List<dynamic>).map<IntervalSelected>(
                (x) => IntervalSelected.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      notes: map['notes']?.toString() ?? '',
      features: map['features'] != null
          ? List<Feature>.from(
              (map['features'] as List<dynamic>).map<Feature>(
                (x) => Feature.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }
  String toJson() => json.encode(toMap());

  factory Plan.fromJson(String source) =>
      Plan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Plan(planName: $planName, price: $price, freeMonths: $freeMonths, isDiscount: $isDiscount, discountPercentage: $discountPercentage, priceAfterDiscount: $priceAfterDiscount, discountStartDate: $discountStartDate, discountEndDate: $discountEndDate, planDuration: $planDuration, is247Days: $is247Days, is24Hours: $is24Hours, intervals: $intervals, notes: $notes, features: $features)';
  }

  @override
  bool operator ==(covariant Plan other) {
    if (identical(this, other)) return true;

    return other.planName == planName &&
        other.price == price &&
        other.freeMonths == freeMonths &&
        other.isDiscount == isDiscount &&
        other.discountPercentage == discountPercentage &&
        other.priceAfterDiscount == priceAfterDiscount &&
        other.discountStartDate == discountStartDate &&
        other.discountEndDate == discountEndDate &&
        other.planDuration == planDuration &&
        other.is247Days == is247Days &&
        other.is24Hours == is24Hours &&
        listEquals(other.intervals, intervals) &&
        other.notes == notes &&
        listEquals(other.features, features);
  }

  @override
  int get hashCode {
    return planName.hashCode ^
        price.hashCode ^
        freeMonths.hashCode ^
        isDiscount.hashCode ^
        discountPercentage.hashCode ^
        priceAfterDiscount.hashCode ^
        discountStartDate.hashCode ^
        discountEndDate.hashCode ^
        planDuration.hashCode ^
        is247Days.hashCode ^
        is24Hours.hashCode ^
        intervals.hashCode ^
        notes.hashCode ^
        features.hashCode;
  }
}

class Feature {
  final String? id;
  final String? name;
  final String? logoId;
  final String? price;
  final FeatureType? pricingOption;
  final String? description;
  Feature({
    this.id,
    this.name,
    this.logoId,
    this.price,
    this.pricingOption,
    this.description,
  });

  Feature copyWith({
    String? id,
    String? name,
    String? logoId,
    String? price,
    FeatureType? pricingOption,
    String? description,
  }) {
    return Feature(
      id: id ?? this.id,
      name: name ?? this.name,
      logoId: logoId ?? this.logoId,
      price: price ?? this.price,
      pricingOption: pricingOption ?? this.pricingOption,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoId': logoId,
      'price': price,
      'pricingOption': pricingOption?.name,
      'description': description,
    };
  }

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      logoId: map['logoId'] != null ? map['logoId'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      pricingOption: map['pricingOption'] != null
          ? FeatureType.values.byName(map['pricingOption'] as String)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Feature.fromJson(String source) =>
      Feature.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Feature(id: $id, name: $name, logoId: $logoId, price: $price, pricingOption: $pricingOption, description: $description)';
  }

  @override
  bool operator ==(covariant Feature other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.logoId == logoId &&
        other.price == price &&
        other.pricingOption == pricingOption &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        logoId.hashCode ^
        price.hashCode ^
        pricingOption.hashCode ^
        description.hashCode;
  }
}

class OpenDuration {
  final String? id;
  final String? day;
  final String? startTime;
  final String? endTime;
  OpenDuration({
    this.id,
    this.day,
    this.startTime,
    this.endTime,
  });

  OpenDuration copyWith({
    String? id,
    String? day,
    String? startTime,
    String? endTime,
  }) {
    return OpenDuration(
      id: id ?? this.id,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory OpenDuration.fromMap(Map<String, dynamic> map) {
    return OpenDuration(
      id: map['id'] != null ? map['id'] as String : null,
      day: map['day'] != null ? map['day'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OpenDuration.fromJson(String source) =>
      OpenDuration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OpenDuration(id: $id, day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(covariant OpenDuration other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.day == day &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^ day.hashCode ^ startTime.hashCode ^ endTime.hashCode;
  }
}

class DiscountDuration {
  final DateTime? start;
  final DateTime? end;
  DiscountDuration({
    this.start,
    this.end,
  });

  DiscountDuration copyWith({
    DateTime? start,
    DateTime? end,
  }) {
    return DiscountDuration(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
    };
  }

  factory DiscountDuration.fromMap(Map<String, dynamic> map) {
    return DiscountDuration(
      start: map['start'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['start'] as int)
          : null,
      end: map['end'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['end'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscountDuration.fromJson(String source) =>
      DiscountDuration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DiscountDuration(start: $start, end: $end)';

  @override
  bool operator ==(covariant DiscountDuration other) {
    if (identical(this, other)) return true;

    return other.start == start && other.end == end;
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode;
}

enum OfferType { monthly, annual }

enum FeatureType {
  free,
  month,
  session,
}

class ScoialMediaLink {
  final String? name;
  final String? link;
  ScoialMediaLink({
    this.name,
    this.link,
  });
  ScoialMediaLink copyWith({
    String? name,
    String? link,
  }) {
    return ScoialMediaLink(
      name: name ?? this.name,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'link': link,
    };
  }

  factory ScoialMediaLink.fromMap(Map<String, dynamic> map) {
    return ScoialMediaLink(
      name: map['name'] != null ? map['name'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoialMediaLink.fromJson(String source) =>
      ScoialMediaLink.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ScoialMediaLink(name: $name, link: $link)';

  @override
  bool operator ==(covariant ScoialMediaLink other) {
    if (identical(this, other)) return true;

    return other.name == name && other.link == link;
  }

  @override
  int get hashCode => name.hashCode ^ link.hashCode;
}
class IntervalSelected {
  final TimeOfDay start;
  final TimeOfDay end;
  final List<String> days;

  const IntervalSelected({
    required this.start,
    required this.end,
    required this.days,
  });

  IntervalSelected copyWith({
    TimeOfDay? start,
    TimeOfDay? end,
    List<String>? days,
  }) {
    return IntervalSelected(
      start: start ?? this.start,
      end: end ?? this.end,
      days: days ?? this.days,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'start': '${start.hour}:${start.minute}',
      'end': '${end.hour}:${end.minute}',
      'days': days,
    };
  }

  factory IntervalSelected.fromMap(Map<String, dynamic> map) {
    final startParts = (map['start'] as String).split(':');
    final endParts = (map['end'] as String).split(':');

    return IntervalSelected(
      start: TimeOfDay(
          hour: int.parse(startParts[0]), minute: int.parse(startParts[1])),
      end: TimeOfDay(
          hour: int.parse(endParts[0]), minute: int.parse(endParts[1])),
      days: List<String>.from(map['days'] as List),
    );
  }

  String toJson() => json.encode(toMap());

  factory IntervalSelected.fromJson(String source) =>
      IntervalSelected.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Interval(start: $start, end: $end, days: $days)';

  @override
  bool operator ==(covariant IntervalSelected other) {
    if (identical(this, other)) return true;

    return other.start == start &&
        other.end == end &&
        listEquals(other.days, days);
  }

  @override
  int get hashCode => start.hashCode ^ end.hashCode ^ days.hashCode;
}

enum PlanDuration {
  monthly,
  annual,
  quarterly,
}

extension PlanDurationX on PlanDuration {
  String get displayName {
    switch (this) {
      case PlanDuration.monthly:
        return 'Monthly';
      case PlanDuration.annual:
        return 'Annual';
      case PlanDuration.quarterly:
        return 'Quarterly';
    }
  }
}
