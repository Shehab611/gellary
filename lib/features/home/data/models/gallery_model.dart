import 'package:equatable/equatable.dart';

class GalleryResponse extends Equatable {
  final String status;
  final GalleryData data;
  final String message;

  const GalleryResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  @override
  List<Object?> get props => [status, data, message];

  factory GalleryResponse.fromJson(Map<String, dynamic> json) {
    return GalleryResponse(
      status: json['status'],
      data: GalleryData.fromJson(json['data']),
      message: json['message'],
    );
  }
}

class GalleryData extends Equatable {
  final List<String> images;

  const GalleryData({required this.images});

  @override
  List<Object?> get props => [images];

  factory GalleryData.fromJson(Map<String, dynamic> json) {
    List<String> imagesList = [];
    for (var image in json['images']) {
      imagesList.add(image as String);
    }
    return GalleryData(images: imagesList);
  }
}
