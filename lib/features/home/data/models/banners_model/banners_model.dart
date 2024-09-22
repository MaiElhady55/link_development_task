import 'banners_data.dart';

class BannersModel {
  BannersData? data;
  int? message;
  bool? status;

  BannersModel({this.data, this.message, this.status});

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        data: json['data'] == null
            ? null
            : BannersData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as int?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'status': status,
      };
}
