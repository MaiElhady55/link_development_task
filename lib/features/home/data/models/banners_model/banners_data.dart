import 'banner.dart';

class BannersData {
  List<Banners>? banners;
  String? image;

  BannersData({this.banners, this.image});

  factory BannersData.fromJson(Map<String, dynamic> json) => BannersData(
        banners: (json['banners'] as List<dynamic>?)
                ?.map((banner) =>
                    Banners.fromJson(banner as Map<String, dynamic>))
                .toList() ??
            [], //
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'banners': banners?.map((e) => e.toJson()).toList(),
        'image': image,
      };
}
