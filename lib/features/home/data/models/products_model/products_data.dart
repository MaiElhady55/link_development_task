import 'products_datum.dart';
import 'links.dart';
import 'meta.dart';

class ProductsData {
  List<ProductsDatum>? datum;
  Links? links;
  Meta? meta;

  ProductsData({this.datum, this.links, this.meta});

  factory ProductsData.fromJson(Map<String, dynamic> json) => ProductsData(
        datum: (json['data'] as List<dynamic>?)
            ?.map((e) => ProductsDatum.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': datum?.map((e) => e.toJson()).toList(),
        'links': links?.toJson(),
        'meta': meta?.toJson(),
      };
}
