import 'dart:io';

import 'package:kamn/features/sports_service_providers/data/model/playground_model.dart';

enum ServiceProviderStatus {
  initial,
  loading,
  locationLoading,
  success,
  failure,
  imagePicked,
  imageDeleted,
  imageUploaded,
  imageCompressed,
  locationDetected
}

extension SportsGroundStateExtension on ServiceProviderState {
  bool get isInitial => state == ServiceProviderStatus.initial;
  bool get isLoading => state == ServiceProviderStatus.loading;
  bool get isSuccess => state == ServiceProviderStatus.success;
  bool get isFailure => state == ServiceProviderStatus.failure;
  bool get isImagePicked => state == ServiceProviderStatus.imagePicked;
  bool get isimageDeleted => state == ServiceProviderStatus.imageDeleted;
  bool get isImageUploaded => state == ServiceProviderStatus.imageUploaded;
  bool get isImageCompressed => state == ServiceProviderStatus.imageCompressed;
  bool get isLocationDetected =>
      state == ServiceProviderStatus.locationDetected;
  bool get isLocationLoading => state == ServiceProviderStatus.locationLoading;
}

class ServiceProviderState {
  final ServiceProviderStatus state;
  final List<PlaygroundModel>? playgrounds;
  final String? erorrMessage;
  final String? successMessage;
  final List<File>? imagesList;

  ServiceProviderState(
      {required this.state,
      this.playgrounds,
      this.erorrMessage,
      this.successMessage,
      this.imagesList});
}
