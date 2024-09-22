class Banners {
  int? id;
  String? image;
  int? productId;

  Banners({this.id, this.image, this.productId});

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        id: json['id'] as int?,
        image: json['image'] as String?,
        productId: json['product_id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'product_id': productId,
      };
}
