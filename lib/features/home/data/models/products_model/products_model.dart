import 'products_data.dart';

class ProductsModel {
  ProductsData? data;
  int? message;
  bool? status;

  ProductsModel({this.data, this.message, this.status});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        data: json['data'] == null
            ? null
            : ProductsData.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as int?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'message': message,
        'status': status,
      };
}
